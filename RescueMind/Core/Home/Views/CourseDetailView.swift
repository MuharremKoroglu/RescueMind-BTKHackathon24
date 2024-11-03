//
//  CourseDetailView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 24.10.2024.
//

import SwiftUI

struct CourseDetailView: View {
    
    @EnvironmentObject private var viewModel : HomeViewViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var course : EducationalMaterialModel?
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            VStack {
                
                if let course = course  {
                    
                    VStack {
                        Image(course.image)
                            .resizable()
                            .frame(height: size.width * 0.8)
                            .mask {
                                GradientLayer(
                                    colors: [.black.opacity(2),.clear],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            }
                        
                        Text(course.title)
                            .frame(maxWidth: .infinity,alignment: .center)
                            .font(.avenir(size: size.width * 0.07))
                            .fontWeight(.semibold)
                    }
                    
                    ScrollView(.vertical,showsIndicators: false) {
                        
                        VStack(spacing: 20) {
                            
                            VStack(alignment: .leading) {
                                Text(course.description)
                                    .font(.avenir(size: size.width * 0.04))
                                    .lineLimit(viewModel.showFullDescription ? nil : 4)
                                Button {
                                    withAnimation(.spring) {
                                        viewModel.showFullDescription.toggle()
                                    }
                                } label: {
                                    Text(viewModel.showFullDescription ? "Less" : "Read More")
                                }
                            }
                            
                            
                            VStack(alignment: .leading) {
                                CourseDetailSubTitles(
                                    title: "Key Statistics",
                                    icon: "chart.pie.fill",
                                    size: size
                                )
                                
                                Divider()
                                
                                ForEach(course.keyPoints, id: \.self) { keyPoint in
                                    HStack {
                                        Circle()
                                            .frame(width: size.width * 0.015, height: size.width * 0.015)
                                        Text(keyPoint)
                                            .font(.avenir(size: size.width * 0.04))
                                    }
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                CourseDetailSubTitles(
                                    title: "Critical Steps",
                                    icon: "chart.bar.fill",
                                    size: size
                                )
                                
                                Divider()
                                
                                ForEach(course.criticalSteps.indices, id: \.self) { stepIndex in
                                    let criticalStep = course.criticalSteps[stepIndex]
                                    HStack {
                                        Image(systemName: "\(stepIndex + 1).circle")
                                            .imageScale(.small)
                                        Text(criticalStep)
                                            .font(.avenir(size: size.width * 0.04))
                                    }.padding(.bottom,5)
                                }
                            }
                            
                            VStack {
                                Divider()
                                
                                Toggle(isOn: $viewModel.courseCompleted) {
                                    Text("Course Completed ?")
                                        .font(.avenir(size: size.width * 0.045))
                                }.tint(.accent)
                                    .onAppear {
                                        viewModel.courseCompleted = viewModel.completedCourses.contains(course)
                                    }
                                    .onChange(of: viewModel.courseCompleted) {
                                        if viewModel.courseCompleted {
                                            viewModel.completedCourses.insert(course)
                                        } else {
                                            viewModel.completedCourses.remove(course)
                                        }
                                    }
                            }
                            
                            VStack(alignment: .center) {
                                
                                Button {
                                    dismiss()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        viewModel.showCourseTestView.toggle()
                                    }
                                } label: {
                                    Text("Start the Test")
                                        .font(.avenir(size: size.width * 0.04))
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                        .padding(10)
                                        .background(
                                            Color.accent
                                                .clipShape(Capsule())
                                        )
                                }.disabled(!viewModel.completedCourses.contains(course))
                                
                            }
                            
                        }.padding([.leading,.trailing,.bottom],10)
                    }
                    
                }else {
                    
                    VStack(alignment: .center) {
                        ProgressView()
                            .tint(.accent)
                            .controlSize(.large)
                        Text("Course is being prepared...")
                            .font(.avenir(size: size.width * 0.05))
                    }.frame(maxWidth: .infinity,maxHeight: .infinity)
                    
                }
            }
        }
    }
}

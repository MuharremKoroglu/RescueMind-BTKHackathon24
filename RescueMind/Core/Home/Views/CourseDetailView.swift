//
//  CourseDetailView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 24.10.2024.
//

import SwiftUI

struct CourseDetailView: View {
    
    @EnvironmentObject private var viewModel : HomeViewViewModel
    
    @State private var showFullDescription: Bool = false
    
    @State private var courseCompleted : Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var course : CourseModel?
    
    @Binding var showTestView : Bool

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            VStack {
                
                if let course = course {

                    VStack {
                        Image(course.courseImage)
                            .resizable()
                            .frame(height: size.width * 0.8)
                            .mask {
                                GradientLayer(
                                    colors: [.black.opacity(2),.clear],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            }
                        
                        Text(course.courseTitle)
                            .frame(maxWidth: .infinity,alignment: .center)
                            .font(.avenir(size: size.width * 0.07))
                            .fontWeight(.semibold)
                    }
                    
                    ScrollView(.vertical,showsIndicators: false) {
                        
                        VStack(spacing: 20) {
                            
                            VStack(alignment: .leading) {
                                Text(course.courseDescription)
                                    .font(.avenir(size: size.width * 0.04))
                                    .lineLimit(showFullDescription ? nil : 4)
                                Button {
                                    withAnimation(.spring) {
                                        showFullDescription.toggle()
                                    }
                                } label: {
                                    Text(showFullDescription ? "Less" : "Read More")
                                }
                            }
                            
                            
                            VStack(alignment: .leading) {
                                CourseDetailSubTitles(
                                    title: "Key Statistics",
                                    icon: "chart.pie.fill",
                                    size: size
                                )
                                
                                Divider()
                                
                                ForEach(course.courseKeyPoints, id: \.self) { keyPoint in
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
                                
                                ForEach(course.courseCriticalSteps.indices, id: \.self) { stepIndex in
                                    let criticalStep = course.courseCriticalSteps[stepIndex]
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
                                
                                Toggle(isOn: $courseCompleted) {
                                    Text("Course Completed ?")
                                        .font(.avenir(size: size.width * 0.045))
                                }.tint(.accent)
                                    .onAppear {
                                        courseCompleted = viewModel.completedCourses.contains(course)
                                    }
                                    .onChange(of: courseCompleted) {
                                        if courseCompleted {
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
                                        showTestView.toggle()
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
                                }
                                
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

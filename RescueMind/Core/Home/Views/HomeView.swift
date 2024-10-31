//
//  HomeView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 22.10.2024.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var viewModel : HomeViewViewModel
    
    @State private var selectedCourseCategory : CourseCategoryTypes = .accidents
    
    @State private var selectedCourse : CourseModel? = nil
    
    @State private var showCourseDetailView : Bool = false
    
    @State private var showCourseTestView : Bool = false
        
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                let size = geometry.size
                
                VStack {
                    
                    HStack(alignment: .center) {
                        
                        VStack(alignment: .leading) {
                            Text("Welcome to")
                                .font(.avenir(size: size.width * 0.045))
                                .foregroundStyle(.secondary)
                            Text("Rescue Mind")
                                .font(.avenir(size: size.width * 0.065))
                                .fontWeight(.bold)
                        }
                        
                        Spacer()
                        
                        Image("profile_picture")
                            .resizable()
                            .frame(width: size.width * 0.12,height: size.width * 0.12)
                            .padding(3)
                            .background(
                                Color.lighterAccent.opacity(0.2)
                                    .clipShape(Circle())
                            )
                        
                    }.frame(maxWidth: .infinity)
                    
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("Good to see you again, John! ")
                            .font(.avenir(size: size.width * 0.04))
                            .fontWeight(.semibold)
                        
                        Text("You're making great progress!")
                            .font(.avenir(size: size.width * 0.035))
                            .foregroundColor(.secondary)
                        
                        Text("Completed: \(Int(viewModel.progress * 100))%")
                            .font(.avenir(size: size.width * 0.035))
                            .foregroundColor(.secondary)
                        
                        ProgressView(value: viewModel.progress)
                            .progressViewStyle(LinearProgressViewStyle(tint: .accentColor))
                            .frame(height: 8)
                            .cornerRadius(4)
                        
                    }.padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [.accent.opacity(0.1),.lighterAccent.opacity(0.2)],
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                )
                        )
                    
                    VStack(alignment: .leading,spacing: 15) {
                        
                        Text("Courses")
                            .font(.avenir(size: size.width * 0.055))
                            .fontWeight(.semibold)
                        
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack {
                                ForEach(CourseCategoryTypes.allCases) { courseCategory in
                                    Button {
                                        selectedCourseCategory = courseCategory
                                    } label: {
                                        Text(courseCategory.categoryTitle)
                                            .font(.avenir(size: size.width * 0.037))
                                            .fontWeight(.regular)
                                    }.tint(.primary)
                                        .padding(10)
                                        .background(
                                            Capsule()
                                                .fill(selectedCourseCategory == courseCategory ? .lighterAccent.opacity(0.3) : .gray.opacity(0.3))
                                        )
                                }
                            }
                        }
                        
                        ScrollView(.vertical,showsIndicators: false) {
                            LazyVGrid(columns: columns,spacing: 10) {
                                ForEach(selectedCourseCategory.categoryCourses) { course in
                                    CourseAndScenarioView(
                                        height: size.width * 0.55,
                                        imageName: course.courseImage,
                                        title: course.courseTitle,
                                        fontSize: size.width * 0.043,
                                        fontWidth: size.width * 0.27
                                    )
                                    .onTapGesture {
                                        selectedCourse = course
                                        showCourseDetailView.toggle()
                                    }
                                }
                            }
                        }
                        
                    }.sheet(isPresented: $showCourseDetailView, content: {
                        CourseDetailView(
                            course: $selectedCourse,
                            showTestView: $showCourseTestView
                        )
                    })
                    .navigationDestination(isPresented: $showCourseTestView) {
                        if let course = selectedCourse {
                            CourseTestView(course: course)
                        }
                    }
                                                        
                }.padding([.top,.leading,.trailing],10)
            }
        }
    }
}

#Preview {
    HomeView()
}

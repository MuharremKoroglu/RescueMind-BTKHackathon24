//
//  ScenarioView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 22.10.2024.
//

import SwiftUI

struct ScenarioView: View {
    
    @EnvironmentObject private var viewModel : ScenariosViewViewModel
        
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                let size = geometry.size
                
                VStack(spacing: 10) {
                    
                    HStack {
                        Text("Scenarios")
                            .font(.avenir(size: size.width * 0.085))
                            .fontWeight(.bold)
                        Spacer()
                        Menu {
                            Picker("", selection: $viewModel.selectedScenarioCategory) {
                                Text("All").tag(nil as CourseCategoryTypes?)
                                ForEach(CourseCategoryTypes.allCases) { category in
                                    Text(category.categoryTitle)
                                        .tag(category)
                                }
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                .font(.title)
                        }
                    }

                    ScrollView(.vertical,showsIndicators: false) {
                        ForEach(viewModel.filteredScenarios) { scenario in
                            CourseAndScenarioView(
                                height: size.width * 0.65,
                                imageName: scenario.courseImage,
                                title: scenario.courseTitle,
                                fontSize: size.width * 0.055,
                                fontWidth: nil
                            )
                        }
                    }

                }.padding(10)
            }
        }
    }
}

#Preview {
    ScenarioView()
}

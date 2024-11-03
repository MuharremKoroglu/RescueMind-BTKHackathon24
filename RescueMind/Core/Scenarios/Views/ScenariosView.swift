//
//  ScenarioView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 22.10.2024.
//

import SwiftUI

struct ScenariosView: View {
    
    @EnvironmentObject private var viewModel : ScenariosViewViewModel
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                let size = geometry.size
                
                VStack(spacing: 10) {
                    
                    ScrollView(.vertical,showsIndicators: false) {
                        ForEach(viewModel.filteredScenarios) { scenario in
                            NavigationLink {
                                ScenarioCaseView(scenario: scenario)
                            } label: {
                                CourseAndScenarioView(
                                    height: size.width * 0.6,
                                    imageName: scenario.image,
                                    title: scenario.title,
                                    fontSize: size.width * 0.055
                                )
                            }
                        }
                    }
                    
                }.padding([.leading,.trailing],10)
                    .navigationTitle("Scenarios")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Menu {
                                Picker("", selection: $viewModel.selectedScenarioCategory) {
                                    Text("All").tag(nil as EducationalMaterialCategoryTypes?)
                                    ForEach(EducationalMaterialCategoryTypes.allCases) { category in
                                        Text(category.categoryTitle)
                                            .tag(category)
                                    }
                                }
                            } label: {
                                Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                    .font(.title2)
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    ScenariosView()
}

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
                    
                    HStack {
                        Text("Scenarios")
                            .font(.avenir(size: size.width * 0.085))
                            .fontWeight(.bold)
                        Spacer()
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
                                .font(.title)
                        }
                    }

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
                    
                }.padding([.top,.leading,.trailing],10)
            }
        }
    }
}

#Preview {
    ScenariosView()
}

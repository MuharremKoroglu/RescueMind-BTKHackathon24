//
//  ScenariosViewViewModel.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 31.10.2024.
//

import Foundation

@MainActor
class ScenariosViewViewModel : GenerativeAISharedViewModel {
    
    @Published var selectedScenarioCategory : EducationalMaterialCategoryTypes? = nil
    @Published var userAnswer : String = ""
    
    var filteredScenarios : [EducationalMaterialModel] {
        if let selectedCategory = selectedScenarioCategory {
            return selectedCategory.categoryCourses
         } else {
             return EducationalMaterialCategoryTypes.allCases.flatMap({$0.categoryCourses})
         }
    }
    
    var isButtonDisabled : Bool {
        let aiResponseCount = messages.filter({$0.messageSender == .generativeAI}).count
        return aiResponseCount == 0 || aiResponseCount == 5 || userAnswer.isEmpty
    }
    
}

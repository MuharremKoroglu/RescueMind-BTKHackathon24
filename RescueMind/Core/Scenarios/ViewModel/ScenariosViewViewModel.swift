//
//  ScenariosViewViewModel.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 31.10.2024.
//

import Foundation
import GoogleGenerativeAI

@MainActor
class ScenariosViewViewModel : ObservableObject {
    
    @Published var selectedScenarioCategory : CourseCategoryTypes? = nil
    
    var filteredScenarios : [CourseModel] {
        if let selectedCategory = selectedScenarioCategory {
            return selectedCategory.categoryCourses
         } else {
             return CourseCategoryTypes.allCases.flatMap({$0.categoryCourses})
         }
    }
    
    private let chat : Chat
    
    init(chat : Chat) {
        self.chat = chat
    }
    
}

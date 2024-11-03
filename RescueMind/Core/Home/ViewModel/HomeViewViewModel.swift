//
//  HomeViewViewModel.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 27.10.2024.
//

import Foundation

@MainActor
class HomeViewViewModel : GenerativeAISharedViewModel {
        
    @Published var selectedCourseCategory : EducationalMaterialCategoryTypes = .accidents
    @Published var selectedCourse : EducationalMaterialModel? = nil
    
    @Published var testResponseButtonTitles : [String] = ["A","B","C","D"]
    
    @Published var showCourseDetailView : Bool = false
    @Published var showCourseTestView : Bool = false
    @Published var showFullDescription: Bool = false
    @Published var courseCompleted : Bool = false
    
    @Published var completedCourses : Set<EducationalMaterialModel> = []
    
    var progress: Double {
        return Double(completedCourses.count) / Double(20)
    }
    
    var isButtonDisabled : Bool {
        let aiResponseCount = messages.filter({$0.messageSender == .generativeAI}).count
        return aiResponseCount == 0 || aiResponseCount == 6
    }
    
}

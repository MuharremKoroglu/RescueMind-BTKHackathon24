//
//  LessonModel.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 23.10.2024.
//

import Foundation

struct EducationalMaterialModel : Identifiable, Hashable {
    
    let id : String
    let title : String
    let description : String
    let image : String
    let keyPoints : [String]
    let criticalSteps : [String]
    
}

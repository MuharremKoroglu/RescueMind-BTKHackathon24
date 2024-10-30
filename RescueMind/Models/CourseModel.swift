//
//  LessonModel.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 23.10.2024.
//

import Foundation

struct CourseModel : Identifiable, Hashable {
    
    let id : String
    let courseTitle : String
    let courseDescription : String
    let courseImage : String
    let courseKeyPoints : [String]
    let courseCriticalSteps : [String]
    
}

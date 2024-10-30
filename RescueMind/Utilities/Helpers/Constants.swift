//
//  Constants.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 30.10.2024.
//

import Foundation

struct Constants {
    
    static let testResponseButtonTitles : [String] = ["A","B","C","D"]
    
    static func courseTestPrompt(courseName: String) -> String {
        return """
        Create a 5-question multiple-choice technical and statistical test about \(courseName). Question-answer options should be in the format A, B, C, and D. After the answer option is received from the user, the next question should be prepared without specifying whether the answer is correct or incorrect. After the test is completed, the accuracy of the user's answers to each question should be checked under the "Test Results" heading. If an incorrect answer is given, the correct answer to the question should be specified to the user. Then, considering the correct and incorrect answers, examine the points that need to be worked on and re-evaluated for the \(courseName) topic under the "Points to Rework" heading and prepare a step-by-step report. The test should start with a welcome message such as "Welcome to the \(courseName) Awareness Test!" The next line should tell the user what the test will be for, such as "This test will assess your knowledge of \(courseName), including its various aspects, response procedures, and associated statistics." Then, on the next line, "Instructions: Choose the best answer for each question and type in the corresponding letter (A, B, C, or D)." The text should be included. Then, the first question should be asked with the phrase "Let's begin!". After the question, the user's response should be waited with the phrase "Please enter your answer:".
        """
    }

}
/*
 Create a 5-question multiple-choice technical and statistical test about \(courseName). Question-answer options should be in the format A, B, C, and D. After the answer option is received from the user, the next question should be prepared without specifying whether the answer is correct or incorrect. After the test is completed, the accuracy of the user's answers to each question should be checked under the "Test Results" heading. If an incorrect answer is given, the correct answer to the question should be specified to the user. Then, considering the correct and incorrect answers, examine the points that need to be worked on and re-evaluated for the \(courseName) topic under the "Points to Rework" heading and prepare a step-by-step report. The test should start with a welcome message such as "Welcome to the \(courseName) Awareness Test!" The next line should tell the user what the test will be for, such as "This test will assess your knowledge of \(courseName), including its various aspects, response procedures, and associated statistics." Then, on the next line, "Instructions: Choose the best answer for each question and type in the corresponding letter (A, B, C, or D)." The text should be included. Then, the first question should be asked with the phrase "Let's begin!". After the question, the user's response should be waited with the phrase "Please enter your answer:".
 */

//
//  Constants.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 30.10.2024.
//

import Foundation

struct Constants {
    
    static let alertTitle : String = "Something Went Wrong"
    
    static let alertMessage : String = "We are unable to process your request at this time. Please try again later."
    
    static let testResponseButtonTitles : [String] = ["A","B","C","D"]
    
    static func courseTestPrompt(courseName: String) -> String {
        return """
            Create a 5-question multiple-choice technical and statistical test about \(courseName). Question-answer options should be in the format A, B, C, and D. After the answer option is received from the user, the next question should be prepared without specifying whether the answer is correct or incorrect. After the test is completed, the accuracy of the user's answers to each question should be checked under the "Test Results" heading. If an incorrect answer is given, the correct answer to the question should be specified to the user. Then, considering the correct and incorrect answers, examine the points that need to be worked on and re-evaluated for the \(courseName) topic under the "Points to Rework" heading and prepare a step-by-step report. The test should start with a welcome message such as "Welcome to the \(courseName) Awareness Test!" The next line should tell the user what the test will be for, such as "This test will assess your knowledge of \(courseName), including its various aspects, response procedures, and associated statistics." Then, on the next line, "Instructions: Choose the best answer for each question and type in the corresponding letter (A, B, C, or D)." The text should be included. Then, the first question should be asked with the phrase "Let's begin!". After the question, the user's response should be waited with the phrase "Please enter your answer:".
        """
    }
    
    static func scenarioCasePrompt(scenarioName: String) -> String {
        return """
            Create a realistic emergency call scenario about \(scenarioName) consisting of 5 steps. The scenario should progress step by step and a person who experienced \(scenarioName) should be imagined calling an emergency call center employee. The scenario should be continued according to the user's response and the scenario should end with the dispatch of the emergency team in step 5. After the scenario is completed, prepare a report for the user under the phrase "Case Report" stating the appropriateness of the answers given to the call received, the speed at which the help team was dispatched and what needs to be done to resolve the case faster. The case study should begin with a welcome message such as "Welcome to the \(scenarioName) Case Study!" The purpose of this study should be stated in a line below with a message such as "This case study is designed to help you better manage stress and situations when searching for \(scenarioName)." The case instructions should be given to the user on a line below with a message such as "Instructions: Clearly and concisely state the most appropriate response to the incoming call." Then, "Let's begin!" The first step of the scenario should be started with the statement. At the end of each step, a blank line should be left and the user's response should be awaited with the message "Please enter your answer:".
        """
    }

}

//
//  HomeViewViewModel.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 27.10.2024.
//

import Foundation
import GoogleGenerativeAI

@MainActor
class HomeViewViewModel : ObservableObject {
    
    @Published var messages : [MessageModel] = []
    @Published var completedCourses : Set<CourseModel> = []
    @Published var isLoading : Bool = false
    @Published var anErrorOccured : Bool = false
    
    var progress: Double {
        return Double(completedCourses.count) / Double(20)
    }
    
    var isButtonDisabled : Bool {
        let aiResponseCount = messages.filter({$0.messageSender == .generativeAI}).count
        return aiResponseCount == 0 || aiResponseCount == 6
    }
    
    private let chat : Chat
    
    init(chat : Chat) {
        self.chat = chat
    }
    
    func generateQuestionWithGenerativeAI(prompt : String) {
        
        isLoading = true
            
        Task {
            
            do {
                
                let response = try await chat.sendMessage(prompt)
                
                let message = MessageModel(
                    messageSender: .generativeAI,
                    messageContent: response.text ?? "Sorry, I couldn't generate a response."
                )
                
                messages.append(message)
                
                isLoading = false
                
            }catch {
                isLoading = false
                anErrorOccured = true
                print("Soru oluşturulamadı : \(error)")
            }
            
        }
        
    }
    
    func sendMessageToGenerativeAI(messageContent : String) {
        
        let message = MessageModel(
            messageSender: .user,
            messageContent: messageContent
        )
        
        messages.append(message)
        
        self.generateQuestionWithGenerativeAI(prompt: messageContent)
        
    }
    
    func cleanMessages() {
        messages.removeAll()
    }
    
}

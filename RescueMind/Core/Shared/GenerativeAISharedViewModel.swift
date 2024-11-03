//
//  GenerativeAIViewModel.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 1.11.2024.
//

import Foundation
import GoogleGenerativeAI

@MainActor
class GenerativeAISharedViewModel: ObservableObject {
    
    @Published var messages: [MessageModel] = []
    @Published var prompt : String = ""
    @Published var isLoading: Bool = false
    @Published var anErrorOccured: Bool = false

    private let chat : Chat
    
    init(chat : Chat) {
        self.chat = chat
    }

    func getMessageFromGenerativeAI() {
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
            } catch {
                isLoading = false
                anErrorOccured = true
                print("Soru oluşturulamadı : \(error)")
            }
        }
    }

    func sendMessageToGenerativeAI() {
        let message = MessageModel(messageSender: .user, messageContent: prompt)
        messages.append(message)
        getMessageFromGenerativeAI()
    }

    func cleanMessages() {
        messages.removeAll()
    }
}


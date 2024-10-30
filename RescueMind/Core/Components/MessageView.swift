//
//  MessageView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 29.10.2024.
//

import SwiftUI

struct MessageView: View {
    
    let messageData : [MessageModel]
    let size : CGSize
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical,showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(messageData, id: \.messageId) { message in
                        HStack {
                            if message.messageSender == .generativeAI {
                                messageBubble(
                                    message.messageContent,
                                    foregroundColor: .primary,
                                    backgroundColor: .gray.opacity(0.3),
                                    alignment: .leading
                                )
                                Spacer()
                            } else {
                                Spacer()
                                messageBubble(
                                    message.messageContent,
                                    foregroundColor: .white,
                                    backgroundColor: .lighterAccent,
                                    alignment: .trailing
                                )
                            }
                        }.id(message.messageId)
                    }
                }
            }.onChange(of: messageData) { 
                if let lastMessage = messageData.last {
                    withAnimation(.spring) {
                        proxy.scrollTo(lastMessage.messageId, anchor: .bottom)
                    }
                }
            }
        }

    }
    
    private func messageBubble(_ text: String,foregroundColor : Color,backgroundColor: Color, alignment : Alignment) -> some View {
        Text(text.localizedStringKey())
            .fontWeight(.medium)
            .padding()
            .foregroundStyle(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(15)
            .frame(maxWidth: size.width * 0.7,alignment: alignment)
    }
}

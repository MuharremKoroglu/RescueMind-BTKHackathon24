//
//  MessageModel.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 28.10.2024.
//

import Foundation
import SwiftUICore

struct MessageModel : Equatable {
    
    let messageId = UUID()
    let messageSender : Sender
    let messageContent : String

}

enum Sender : Equatable {
    case generativeAI
    case user
}

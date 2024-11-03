//
//  UserProgressMessageView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 3.11.2024.
//

import SwiftUI

struct UserProgressMessageView: View {
    
    let message : String
    let font : Font
    let fontWeight : Font.Weight?
    let fontColor : Color
    
    init(message: String, font: Font, fontWeight: Font.Weight? = nil,fontColor : Color = .primary) {
        self.message = message
        self.font = font
        self.fontWeight = fontWeight
        self.fontColor = fontColor
    }
    
    var body: some View {
        Text(message)
            .font(font)
            .fontWeight(fontWeight)
            .foregroundStyle(fontColor)
    }
}

//
//  AnimatedGeminiStarLogo.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 31.10.2024.
//

import SwiftUI

struct RotatingImage: View {
    
    let imageName : String
    let isImageRotating : Bool
    let imageWidth : CGFloat
    let imageHeight : CGFloat

    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: imageWidth, height: imageHeight)
            .rotationEffect(.degrees(isImageRotating ? 360 : 0))
            .animation(isImageRotating ?
                       Animation.linear(duration: 1.0).repeatForever(autoreverses: false) :
                    .default, value: isImageRotating)
    }
}

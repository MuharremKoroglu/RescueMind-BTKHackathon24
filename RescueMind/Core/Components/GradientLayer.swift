//
//  GradientLayer.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 25.10.2024.
//

import SwiftUI

struct GradientLayer: View {
    
    let colors: [Color]
    let startPoint: UnitPoint
    let endPoint: UnitPoint
    
    init(colors: [Color] = [.black,.clear], startPoint: UnitPoint = .bottom, endPoint: UnitPoint = .top) {
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    var body: some View {
        LinearGradient(colors: colors, startPoint: startPoint, endPoint: endPoint)
    }
}


//
//  AccountInformationView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 3.11.2024.
//

import SwiftUI

struct AccountInformationView: View {
    
    let informationTitle : String
    let font : Font
    let fontWeight : Font.Weight?
    
    init(informationTitle: String, font: Font, fontWeight: Font.Weight? = nil) {
        self.informationTitle = informationTitle
        self.font = font
        self.fontWeight = fontWeight
    }
    
    var body: some View {
        Text(informationTitle)
            .font(font)
            .fontWeight(fontWeight)
    }
}

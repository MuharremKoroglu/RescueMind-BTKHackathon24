//
//  BackButtonView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 1.11.2024.
//

import SwiftUI

struct BackButtonView: View {
    
    var action : () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.left")
                .foregroundStyle(.accent)
        }
    }
}

//
//  AlertActionButtonView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 1.11.2024.
//

import SwiftUI

struct AlertActionButtonView: View {
    
    var buttonAction : () -> Void
    
    var body: some View {
        Button("Okay", action: buttonAction)
    }
}

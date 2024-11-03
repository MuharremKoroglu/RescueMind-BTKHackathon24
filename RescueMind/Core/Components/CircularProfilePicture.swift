//
//  CircularProfilePicture.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 3.11.2024.
//

import SwiftUI

struct CircularProfilePicture: View {
    
    let width : CGFloat
    let height : CGFloat
    
    var body: some View {
        Image("profile_picture")
            .resizable()
            .frame(width: width,height: height)
            .padding(3)
            .background(
                Color.lighterAccent.opacity(0.2)
                    .clipShape(Circle())
            )
    }
}

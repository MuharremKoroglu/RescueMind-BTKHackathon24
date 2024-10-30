//
//  CourseDetailSubTitles.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 27.10.2024.
//

import SwiftUI

struct CourseDetailSubTitles: View {
    
    let title : String
    let icon : String
    let size : CGSize
    
    var body: some View {
        HStack {
            Text(title)
                .font(.avenir(size: size.width * 0.05))
                .fontWeight(.semibold)
            Image(systemName: icon)
                .foregroundStyle(.lighterAccent)
        }
    }
}

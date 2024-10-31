//
//  CourseAndScenarioView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 31.10.2024.
//

import SwiftUI

struct CourseAndScenarioView: View {
    
    let height : CGFloat
    let imageName : String
    let title : String
    let fontSize : CGFloat
    let fontWidth : CGFloat?
    
    init(height: CGFloat, imageName: String, title: String, fontSize: CGFloat, fontWidth: CGFloat? = nil) {
        self.height = height
        self.imageName = imageName
        self.title = title
        self.fontSize = fontSize
        self.fontWidth = fontWidth
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
            GradientLayer()
            Text(title)
                .frame(width: fontWidth,alignment: .leading)
                .font(.avenir(size: fontSize))
                .foregroundStyle(.white)
                .fontWeight(.medium)
                .lineLimit(2)
                .padding(.horizontal,7)
                .padding(.vertical,7)
        }.frame(height: height)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

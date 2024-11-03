//
//  OnboardingView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 3.11.2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var showOnboarding : Bool
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            VStack(alignment: .center) {
                
                VStack {
                    Image("app_logo")
                        .resizable()
                        .scaledToFit()
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
                VStack(alignment: .leading,spacing: 0) {
                    Text("Powered by")
                        .font(.avenir(size: size.width * 0.03))
                        .fontWeight(.semibold)
                    Image("gemini_logo")
                        .resizable()
                        .frame(width: size.width * 0.26, height: size.width * 0.09)
                }
                
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.spring) {
                        showOnboarding.toggle()
                    }
                }
            }
        }
    }
}

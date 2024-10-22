//
//  CustomTabBarView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 22.10.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(alignment: .center) {
            ForEach(CustomTabBarTabTypes.allCases) { tabItem in
                Button {
                    selectedTab = tabItem.tabTagNumber
                } label: {
                    GeometryReader { geometry in
                        let size = geometry.size
                        
                        if selectedTab == tabItem.tabTagNumber {
                            UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 10,bottomTrailing: 10) )
                                .foregroundStyle(.lighterAccent)
                                .frame(width: size.width / 2,height: 4)
                                .padding(.leading,size.width / 4)
                        }

                        VStack(alignment: .center, spacing: 5) {
                            
                            Image(systemName: tabItem.tabIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: tabItem.tabTagNumber == 1 ? 32 : 24, height: tabItem.tabTagNumber == 1 ? 32 : 24)
                                .foregroundStyle(tabItem.tabTagNumber == 1 ? .accent : .gray)
                            
                            Text(tabItem.tabTitle)
                                .font(.caption)
                                .foregroundStyle(tabItem.tabTagNumber == 1 ? .accent : .gray)
                            
                        }.frame(width: size.width, height: size.height)
                    }
                }
            }
        }.frame(height: 70)
    }
}

#Preview {
    CustomTabBarView(selectedTab: .constant(0))
}

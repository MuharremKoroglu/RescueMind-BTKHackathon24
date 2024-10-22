//
//  ContentView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 22.10.2024.
//

import SwiftUI

struct RootView: View {
    
    @State private var selectedTab : Int = 0
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                ScenarioView()
                    .tag(1)
                SettingsView()
                    .tag(2)
            }
            CustomTabBarView(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    RootView()
}

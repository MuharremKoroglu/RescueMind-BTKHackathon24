//
//  ContentView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 22.10.2024.
//

import SwiftUI
import GoogleGenerativeAI

struct RootView: View {
    
    @StateObject private var homeViewViewModel = HomeViewViewModel()
    @StateObject private var scenariosViewViewModel = ScenariosViewViewModel()
    
    @State private var selectedTab : Int = 0
        
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .environmentObject(homeViewViewModel)
                    .tag(0)
                ScenariosView()
                    .environmentObject(scenariosViewViewModel)
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

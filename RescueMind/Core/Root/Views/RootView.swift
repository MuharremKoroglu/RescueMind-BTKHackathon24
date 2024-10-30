//
//  ContentView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 22.10.2024.
//

import SwiftUI
import GoogleGenerativeAI

struct RootView: View {
    
    @StateObject private var homeViewViewModel : HomeViewViewModel
    
    @State private var selectedTab : Int = 0
        
    init() {
        
        let generativeModel = GenerativeModel(
            name: "gemini-1.5-flash",
            apiKey: APIKey.default
        )
        
        let chat = generativeModel.startChat()
        
        _homeViewViewModel = StateObject(
            wrappedValue: HomeViewViewModel(chat: chat)
        )
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .environmentObject(homeViewViewModel)
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

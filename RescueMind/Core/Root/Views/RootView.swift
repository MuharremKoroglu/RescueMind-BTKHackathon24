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
    @StateObject private var scenariosViewViewModel : ScenariosViewViewModel
    
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
        
        _scenariosViewViewModel = StateObject(
            wrappedValue: ScenariosViewViewModel(chat: chat)
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

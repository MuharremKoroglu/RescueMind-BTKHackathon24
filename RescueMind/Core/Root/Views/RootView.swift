//
//  ContentView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 22.10.2024.
//

import SwiftUI
import GoogleGenerativeAI

struct RootView: View {
    
    @StateObject private var sharedViewModel : GenerativeAISharedViewModel
    @StateObject private var homeViewViewModel : HomeViewViewModel
    @StateObject private var scenariosViewViewModel : ScenariosViewViewModel
    @StateObject private var settingsViewViewModel = SettingsViewViewModel()
    
    @State private var selectedTab : Int = 0
    @State private var showOnboarding = true
        
    init() {
        
        let chat : Chat = GenerativeModel(
            name: "gemini-1.5-flash",
            apiKey: APIKey.default
        ).startChat()
        
        _sharedViewModel = StateObject(wrappedValue: GenerativeAISharedViewModel(chat: chat))
        _homeViewViewModel = StateObject(wrappedValue: HomeViewViewModel(chat: chat))
        _scenariosViewViewModel = StateObject(wrappedValue: ScenariosViewViewModel(chat: chat))
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        if showOnboarding {
            OnboardingView(showOnboarding: $showOnboarding)
        }else {
            VStack(spacing: 0) {
                TabView(selection: $selectedTab) {
                    HomeView()
                        .environmentObject(homeViewViewModel)
                        .tag(0)
                    ScenariosView()
                        .environmentObject(scenariosViewViewModel)
                        .tag(1)
                    SettingsView()
                        .environmentObject(settingsViewViewModel)
                        .tag(2)
                }
                CustomTabBarView(selectedTab: $selectedTab)
            }
        }
    }
}

#Preview {
    RootView()
}

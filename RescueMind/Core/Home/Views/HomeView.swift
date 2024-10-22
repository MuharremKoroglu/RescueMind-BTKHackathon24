//
//  HomeView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 22.10.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Home View")
            }.navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}

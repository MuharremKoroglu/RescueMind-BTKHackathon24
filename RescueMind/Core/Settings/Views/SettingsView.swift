//
//  SettingsView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 22.10.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject private var viewModel : SettingsViewViewModel
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                let size = geometry.size
                
                VStack {
                    List {
                        Section {
                            HStack {
                                Image(viewModel.user.userProfileImage)
                                    .resizable()
                                    .frame(width: size.width * 0.2, height: size.width * 0.2)
                                    .clipShape(Circle())
                                VStack(alignment: .leading,spacing: 5) {
                                    AccountInformationView(
                                        informationTitle: viewModel.user.userName,
                                        font: .avenir(size: size.width * 0.05),
                                        fontWeight: .semibold)
                                    AccountInformationView(
                                        informationTitle: viewModel.user.userEmail,
                                        font: .avenir(size: size.width * 0.035))
                                    AccountInformationView(
                                        informationTitle: viewModel.user.userPhoneNumber,
                                        font: .avenir(size: size.width * 0.035))
                                }.frame(maxWidth: .infinity)
                            }
                        }
                        
                        ForEach(SettingCategoryTypes.allCases) { category in
                            Section(header: Text(category.categoryTitle)) {
                                ForEach(category.options) { option in
                                    if let icon = option.icon {
                                        HStack {
                                            Text(option.title)
                                            Spacer()
                                            Image(systemName: icon)
                                        }
                                    } else {
                                        Toggle(option.title, isOn: .constant(true))
                                            .tint(.accent)
                                    }
                                }
                            }
                        }
                        
                        Section {
                            Button("Sign Out", role: .destructive) {}
                        }
                    }
                }.navigationTitle("Settings")
            }
        }
    }
}

#Preview {
    SettingsView()
}

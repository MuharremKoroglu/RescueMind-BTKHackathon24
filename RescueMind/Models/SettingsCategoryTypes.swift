//
//  SettingsCategoryTypes.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 2.11.2024.
//

import Foundation

enum SettingCategoryTypes: CaseIterable, Identifiable {
    
    var id : SettingCategoryTypes { self }
    case account
    case notifications
    case privacy
    case support
    
    var categoryTitle: String {
        switch self {
        case .account:
            return "Account"
        case .notifications:
            return "Notifications"
        case .privacy:
            return "Privacy & Security"
        case .support:
            return "Help & Support"
        }
    }
    
    var options: [SettingOption] {
        switch self {
        case .account:
            return [
                SettingOption(title: "Edit Profile", icon: "chevron.right"),
                SettingOption(title: "Change Password", icon: "chevron.right"),
                SettingOption(title: "Medical Profile", icon: "chevron.right")
            ]
        case .notifications:
            return [
                SettingOption(title: "Enable Notifications", icon: nil),
                SettingOption(title: "Email Notifications", icon: nil),
                SettingOption(title: "SMS Notifications", icon: nil)
            ]
        case .privacy:
            return [
                SettingOption(title: "Privacy Policy", icon: "chevron.right"),
                SettingOption(title: "Terms of Service", icon: "chevron.right"),
                SettingOption(title: "Blocked Accounts", icon: "chevron.right")
            ]
        case .support:
            return [
                SettingOption(title: "Contact Support", icon: "chevron.right"),
                SettingOption(title: "FAQ", icon: "chevron.right")
            ]
        }
    }
}

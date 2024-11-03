//
//  SettingsViewViewModel.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 2.11.2024.
//

import Foundation

class SettingsViewViewModel : ObservableObject {
    
    let user : AccountModel = AccountModel(
        userProfileImage: "profile_picture",
        userName: "John Fowler",
        userEmail: "john.fowler@example.com",
        userPhoneNumber: "(679) 293-6725"
    )

}

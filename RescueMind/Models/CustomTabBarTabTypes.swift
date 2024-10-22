//
//  CustomTabBarTabTypes.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 22.10.2024.
//

import Foundation

enum CustomTabBarTabTypes : String, Identifiable, CaseIterable {
    
    var id : CustomTabBarTabTypes { self }
    case home
    case scenarios
    case settings
    
    var tabTitle : String {
        switch self {
        default:
            self.rawValue.capitalized
        }
    }
    
    var tabIcon : String {
        switch self {
        case .home:
            "house"
        case .scenarios:
            "light.beacon.min.fill"
        case .settings:
            "gear"
        }
    }
    
    var tabTagNumber : Int {
        switch self {
        case .home:
            0
        case .scenarios:
            1
        case .settings:
            2
        }
    }
    
}

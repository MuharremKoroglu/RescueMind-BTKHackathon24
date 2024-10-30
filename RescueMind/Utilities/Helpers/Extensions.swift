//
//  Extensions.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 23.10.2024.
//

import SwiftUI

extension Font {
    static func avenir(size: CGFloat) -> Font {
        return Font.custom("Avenir", size: size)
    }
}

extension String {
    func localizedStringKey() -> LocalizedStringKey{
        return LocalizedStringKey(self)
    }
}

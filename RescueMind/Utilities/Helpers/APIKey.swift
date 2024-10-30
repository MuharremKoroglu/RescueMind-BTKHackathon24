//
//  APIKey.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 28.10.2024.
//

import Foundation

enum APIKey {
  
  static var `default`: String {
      
      guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist")
      else {
        fatalError("Couldn't find file 'Info.plist'.")
      }
      
      let plist = NSDictionary(contentsOfFile: filePath)
      
      guard let value = plist?.object(forKey: "GEMINIAI_API_KEY") as? String else {
        fatalError("Couldn't find key 'GEMINIAI_API_KEY' in 'Info.plist'.")
      }
      
      let trimmedValue = value.trimmingCharacters(in: CharacterSet(charactersIn: "\""))
      
      if trimmedValue.starts(with: "_") {
          fatalError("Follow the instructions at https://ai.google.dev/tutorials/setup to get an API key.")
      }

      return trimmedValue
      
  }
    
}

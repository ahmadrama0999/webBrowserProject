//
//  UserNotes.swift
//  webBrowserProject
//
//  Created by Ramin Akhmad on 21.05.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import Foundation

class UserSettings {
    
    static let shared = UserSettings()
    private let urlArrayKey = "urlArray"
    private let  defaults = UserDefaults.standard
    
    var urlArray: [String] {
        get {
            return defaults.stringArray(forKey: urlArrayKey) ?? []
        }
        set {
            defaults.set(newValue, forKey: urlArrayKey)
        }
    }
    
    private init() {}
    
    
}

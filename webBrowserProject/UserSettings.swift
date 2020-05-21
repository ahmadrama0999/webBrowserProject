//
//  UserNotes.swift
//  webBrowserProject
//
//  Created by Ramin Akhmad on 21.05.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import Foundation

class UserSettings {
    
    private init() {}
    
    static let shared = UserSettings()
    
    private let  defaults = UserDefaults.standard
    
    var urlArray: [String] {
        get {
            return defaults.stringArray(forKey: "urlArray") ?? []
        }
        set {
            defaults.set(newValue, forKey: "urlArray")
        }
    }
    
}

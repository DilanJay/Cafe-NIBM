//
//  SessionManager.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-28.
//

import Foundation

class SessionManager {
    func getLoggedStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: "Logged_In")
    }
    
    func saveUserLogin() {
        UserDefaults.standard.setValue(true, forKey: "Logged_In")
    }
    
    func clearUserLoggedStatus() {
        UserDefaults.standard.setValue(false, forKey: "Logged_In")
    }
}

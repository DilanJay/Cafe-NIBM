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
    
    func saveUserLogin(user: User) {
        UserDefaults.standard.setValue(true, forKey: "Logged_In")
        UserDefaults.standard.setValue(user.userName, forKey: "User_Name")
        UserDefaults.standard.setValue(user.email, forKey: "User_Email")
        UserDefaults.standard.setValue(user.phoneNo, forKey: "User_PhoneNo")
    }
    
    func getUserData() -> User {
        let user = User(
            userName: UserDefaults.standard.string(forKey: "User_Name") ?? "",
            email: UserDefaults.standard.string(forKey: "User_Email") ?? "",
            password: "",
            phoneNo: UserDefaults.standard.string(forKey: "User_PhoneNo") ?? ""
        )
        
        return user
    }
    
    func clearUserLoggedStatus() {
        UserDefaults.standard.setValue(false, forKey: "Logged_In")
    }
}

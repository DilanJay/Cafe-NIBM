//
//  EntityModel.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-27.
//

import Foundation

struct User {
    var userName: String
    var email: String
    var password: String
    var phoneNo: String
}

struct FoodItem {
    var foodID: String
    var foodImage: String
    var foodName: String
    var description: String
    var price: Double
    var discount: Int
}

//class User1 {
//    var userName: String
//    var email: String
//    var password: String
//    var phoneNo: String
//
//    internal init(userName: String, email: String, password: String, phoneNo: String) {
//        self.userName = userName
//        self.email = email
//        self.password = password
//        self.phoneNo = phoneNo
//    }
//}

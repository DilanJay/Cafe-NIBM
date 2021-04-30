//
//  CartHandler.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-30.
//

import Foundation

class CartHandler {
    static var foodItems: [FoodItem] = []
    
    static func getCartItems() -> [FoodItem]{
        return foodItems
    }
    
    static func clearCart() {
        self.foodItems.removeAll()
    }
}

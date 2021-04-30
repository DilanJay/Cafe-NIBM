//
//  CartViewController.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-30.
//

import UIKit
import Firebase
import  Loaf

class CartViewController: UIViewController {
    @IBOutlet weak var tblCartItems: UITableView!
    var ref: DatabaseReference!
    
    var cartItems: [FoodItem] =  []
    let sessionManager = SessionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()


        self.cartItems = CartHandler.getCartItems()
        tblCartItems.register(UINib(nibName: "FoodItemTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodCell")
    }

    @IBAction func btnCart(_ sender: UIButton) {
        saveOrder()
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblCartItems.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodItemTableViewCell
        cell.setUpView(foodItem: cartItems[indexPath.row])
        return cell
    }
}

extension CartViewController {
    func saveOrder() {
        var orderData: [String: Any] = [:]
        var foodItemInfo: [String: Any] = [:]
        
        for index in 0..<cartItems.count {
            foodItemInfo.removeAll()
            foodItemInfo["foodName"] = cartItems[index].foodName
            foodItemInfo["description"] = cartItems[index].description
            foodItemInfo["price"] = cartItems[index].price
            orderData["\(index)"] = foodItemInfo
        }
        
        var order: [String: Any] = [:]
        order["status"] = "pending"
        order["orderItems"] = orderData
        
        
        self.ref.child("orders").child(sessionManager.getUserData().email
                                        .replacingOccurrences(of: "@", with: "_")
                                        .replacingOccurrences(of: ".", with: "_"))
            .childByAutoId()
            .setValue( order) {
            (error, ref) in
            
            if let err = error {
                print(err.localizedDescription)
                Loaf("Order data not saved on database", state: .error, sender: self).show()
                return
            }
            
            Loaf("Order data saved on database", state: .success, sender: self).show() {
                type in
                CartHandler.clearCart()
                self.dismiss(animated: true, completion: nil)
            }
            
        }
    }
}
 

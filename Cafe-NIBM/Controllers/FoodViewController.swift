//
//  FoodViewController.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-29.
//

import UIKit
import Firebase

class FoodViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var tblFood: UITableView!
    
    var foodItem: [FoodItem] = [

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblFood.register(UINib(nibName: "FoodItemTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodCell")
        
        ref = Database.database().reference()
        
        getFoodItemData()
    }
}

extension FoodViewController {
    func getFoodItemData() {
        ref.child("foodItems").observe(.value, with: {
            (snapshot) in

            if let data = snapshot.value {
                if let foodItems = data as? [String: Any] {
                    for item in foodItems {
                        if let foodInfo = item.value as? [String: Any] {
                            
                            let singleFoodItem = FoodItem(
                                foodID: "",
                                foodImage: foodInfo["image"] as! String,
                                foodName: foodInfo["name"] as! String,
                                description: foodInfo["description"] as! String,
                                price: foodInfo["price"] as! Double,
                                discount: foodInfo["discount"] as! Int,
                                category: foodInfo["category"] as! String)
                            
                            self.foodItem.append(singleFoodItem)
                        }
                    }
                    self.tblFood.reloadData()
                }
            }
        })
    }
}

extension FoodViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFood.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodItemTableViewCell
        cell.setUpView(foodItem: foodItem[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

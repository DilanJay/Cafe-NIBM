//
//  FoodViewController.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-29.
//

import UIKit

class FoodViewController: UIViewController {
    
    @IBOutlet weak var tblFood: UITableView!
    
    var foodItem: [FoodItem] = [
        FoodItem(foodID: "001", foodImage: "riceNcurry", foodName: "Rice and Curry", description: "Sri lankan special rice and curry", price: 450, discount: 10),
        FoodItem(foodID: "002", foodImage: "drinks", foodName: "Mango Juice", description: "Number One fruit fuice", price: 200, discount: 5),
        FoodItem(foodID: "003", foodImage: "burger", foodName: "Chicken Burger", description: "Spicy chicken", price: 750, discount: 0)

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblFood.register(UINib(nibName: "FoodItemTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodCell")
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
}

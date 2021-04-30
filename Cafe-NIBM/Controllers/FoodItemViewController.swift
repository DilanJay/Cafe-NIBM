//
//  FoodItemViewController.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-30.
//

import UIKit
import Kingfisher
import Loaf

class FoodItemViewController: UIViewController {
    
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblFoodDescription: UILabel!
    @IBOutlet weak var lblFoodPrice: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    
    var foodItem : FoodItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = self.foodItem {
            imgFood.kf.setImage(with: URL(string: item.foodImage))
            lblFoodName.text = item.foodName
            lblFoodDescription.text = item.description
            lblFoodPrice.text = "LKR-\(item.price)"
            lblDiscount.text = "\(item.discount)% OFF"
        }
    }

    @IBAction func btnBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnAddToCart(_ sender: UIButton) {
        if let item = self.foodItem {
            CartHandler.foodItems.append(item)
        }
        Loaf("Item Added to the Cart Successfully!", state: .success, sender: self).show()
    }
}

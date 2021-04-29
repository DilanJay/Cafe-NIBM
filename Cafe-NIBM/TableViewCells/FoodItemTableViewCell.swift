//
//  FoodItemTableViewCell.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-29.
//

import UIKit

class FoodItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    @IBOutlet weak var foodDiscount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUpView(foodItem: FoodItem) {
        foodName.text = foodItem.foodName
        foodDescription.text = foodItem.description
        foodPrice.text = "LKR- \(foodItem.price)"
        foodImage.image = UIImage(named: foodItem.foodImage)
        
        if foodItem.discount > 0 {
            foodDiscount.isHidden = false
            foodDiscount.text = "\(foodItem.discount)% OFF"
        } else {
            foodDiscount.isHidden = true
            foodDiscount.text = ""
        }
    }
}

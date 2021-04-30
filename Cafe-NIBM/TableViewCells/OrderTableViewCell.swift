//
//  OrderTableViewCell.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-30.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblOrderID: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUpUI(order: Order) {
        lblOrderID.text = order.orderID
        lblStatus.text = order.orderStatus
        lblTotal.text = "LKR- \(order.orderTotal)"
    }
}

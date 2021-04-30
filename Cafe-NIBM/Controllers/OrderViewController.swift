//
//  OrderViewController.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-30.
//

import UIKit
import Firebase
import Loaf

class OrderViewController: UIViewController {
    
    @IBOutlet weak var tblOrders: UITableView!
    var ref: DatabaseReference!
    let sessionManager =  SessionManager()
    
    var orders: [Order] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        tblOrders.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getAllOrders()
    }

}

extension OrderViewController {
    func getAllOrders() {
        self.orders.removeAll()
        self.ref.child("orders")
            .child(sessionManager.getUserData().email
            .replacingOccurrences(of: "@", with: "_")
                    .replacingOccurrences(of: ".", with: "_"))
            .observe(.value, with: {
                snapshot in
                if let data = snapshot.value {
                    if let orders = data as? [String : Any] {
                        for singleOrder in orders {
                            var placedOrder = Order()
                            placedOrder.orderID = singleOrder.key
                            if let orderInfo = singleOrder.value as? [String : Any] {
                                placedOrder.orderStatus = orderInfo["status"] as! String
                                if let orderItems = orderInfo["orderItems"] as? [Any] {
                                    for item in orderItems {
                                        if let itemInfo = item as? [String: Any] {
                                            placedOrder.orderTotal+=itemInfo["price"] as! Double
                                        }
                                    }
                                }
                            }
                            self.orders.append(placedOrder)
                        }
                        self.tblOrders.reloadData()
                    }
                }
            })
    }
}
 
extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblOrders.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderTableViewCell
        cell.setUpUI(order: orders[indexPath.row])
        return cell
    }
}

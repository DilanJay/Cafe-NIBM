//
//  AccountViewController.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-30.
//

import UIKit

class AccountViewController: UIViewController {
    
    let sessionManager = SessionManager()
    
    @IBOutlet weak var txtUserName: UILabel!
    @IBOutlet weak var txtUserEmail: UILabel!
    @IBOutlet weak var txtUserPhone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let user = sessionManager.getUserData()
        txtUserName.text = user.userName
        txtUserEmail.text = user.email
        txtUserPhone.text = user.phoneNo
    }
    
    @IBAction func btnSignOut(_ sender: UIButton) {
        sessionManager.clearUserLoggedStatus()
        dismiss(animated: true, completion: nil)
        //performSegue(withIdentifier: "LaunchToSignIn", sender: nil)
    }
}

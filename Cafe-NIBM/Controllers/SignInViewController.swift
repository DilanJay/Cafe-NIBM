//
//  SignInViewController.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-27.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnSignIn(_ sender: UIButton) {
        if txtEmail.text!.count < 5 {
            print("Invalid Email")
        }
    }
}

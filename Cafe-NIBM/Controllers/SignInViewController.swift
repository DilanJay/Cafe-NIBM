//
//  SignInViewController.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-27.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnSignIn(_ sender: UIButton) {
        if validateInput() {
            authenticationUser(email: txtEmail.text!, password: txtPassword.text!)
        } else {
            print("Found Input Error")
        }
    }
    
    func validateInput() -> Bool {
        guard let email = txtEmail.text else {
            print("Email is Null")
            return false
        }
        
        guard let password = txtPassword.text else {
            print("Password id Null")
            return false
            
        }
        
        if email.count < 5 {
            print("Enter valid Email")
            return false
        }
        
        if password.count < 5 {
            print("Enter valid Password")
            return false
        }
        
        return true
    }
    
    func authenticationUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            authResult, error in
            
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            if let result = authResult {
                print("User email: \(result.user.email ?? "Not found")")
            }
        }
    }
}

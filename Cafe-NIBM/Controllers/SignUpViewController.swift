//
//  SignUpViewController.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-28.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNo: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnSignIn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        if validateInpute() {
            registerUser(email: txtEmail.text!, password: txtPassword.text!)
        } else {
            print("Input error found")
        }
    }
    
    func registerUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            if let result = authResult {
                print("User added with email: \(result.user.email ?? "Not found")")
            }
        }
    }
    
    func validateInpute() -> Bool {
        guard let name = txtName.text else {  print("Name is null")
            return false
        }
        
        guard let email = txtEmail.text else {  print("Email is null")
            return false
        }
        
        guard let phoneNo = txtPhoneNo.text else {  print("Phone number is null")
            return false
        }
        
        guard let password = txtPassword.text else {  print("Password is null")
            return false
        }
        
        if name.count < 5 {
            print("Enter valid name")
            return false
        }
        
        if email.count < 5 {
            print("Enter valid email")
            return false
        }
        
        if phoneNo.count < 10 {
            print("Enter valid phone number")
            return false
        }
        
        if password.count < 5 {
            print("Enter valid password")
            return false
        }
        return true
    }
}

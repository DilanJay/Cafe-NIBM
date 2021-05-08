//
//  SignUpViewController.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-28.
//

import UIKit
import Firebase
import Loaf
import SPPermissions

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNo: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    @IBAction func btnSignIn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btnLocation(_ sender: UIButton) {
        let controller = SPPermissions.list([.locationAlwaysAndWhenInUse])
        controller.titleText = "Location Permission"
        controller.headerText = "Please allow to visit Cafe NIBM"
        controller.footerText = "This is Required!!!"
        
        controller.present(on: self)
    }
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        
        if !InputValidator.isValidName(name: txtName.text ?? "") {
            Loaf("Please enter a valid Name", state: .error, sender: self).show()
            return
        }
        
        if !InputValidator.isValidEmai(email: txtEmail.text ?? "") {
            Loaf("Please enter a valid Email", state: .error, sender: self).show()
            return
        }
        
        if !InputValidator.isValidMobile(mobile: txtPhoneNo.text ?? "") {
            Loaf("Please enter a valid Phone number", state: .error, sender: self).show()
            return
        }
        
        if !InputValidator.isValidMobile(mobile: txtPhoneNo.text ?? ""){
            Loaf("Please enter a valid Phone number", state: .error, sender: self).show()
            return
        }
        
        if !InputValidator.isValidPassword(password: txtPassword.text ?? "", minLength: 8, maxLength: 30) {
            Loaf("Please enter a valid Password", state: .error, sender: self).show()
            return
        }
        
        let user = User(userName: txtName.text ?? "", email: txtEmail.text ?? "", password: txtPassword.text ?? "", phoneNo: txtPhoneNo.text ?? "")
        
        registerUser(user: user)
    }
    
    func registerUser(user: User) {
    Auth.auth().createUser(withEmail: user.email, password: user.password) { authResult, error in
            if let err = error {
                print(err.localizedDescription)
                Loaf("Sign up failed!", state: .error, sender: self).show()
                return
            }
        self.saveUserData(user: user )
        }
    }
    
    func saveUserData(user: User) {
        let userData = [
            "name" : user.userName,
            "email" : user.email,
            "password" : user.password,
            "phone" : user.phoneNo
            
        ]
        self.ref.child("users").child(user.email.replacingOccurrences(of: "@", with: "_").replacingOccurrences(of: ".", with: "_")).setValue( userData) {
            (error, ref) in
            
            if let err = error {
                print(err.localizedDescription)
                Loaf("Use data not saved on database", state: .error, sender: self).show()
                return
            }
            
            Loaf("Use data saved on database", state: .success, sender: self).show() {
                type in
                self.dismiss(animated: true, completion: nil)
            }
            
        }
    }
}

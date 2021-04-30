//
//  SignInViewController.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-27.
//

import UIKit
import Firebase
import Loaf

class SignInViewController: UIViewController {
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSignIn(_ sender: UIButton) {
        
        if !InputValidator.isValidEmai(email: txtEmail.text ?? "") {
            Loaf("Please enter a valid Email", state: .error, sender: self).show()
            return
        }
        
        if !InputValidator.isValidPassword(password: txtPassword.text ?? "", minLength: 8, maxLength: 30) {
            Loaf("Please enter a valid Password", state: .error, sender: self).show()
            return
        }
        authenticationUser(email: txtEmail.text!, password: txtPassword.text!)
    }
     
    func authenticationUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            authResult, error in
            
            if let err = error {
                print(err.localizedDescription)
                Loaf("User name or Password is invalid!", state: .error, sender: self).show()
                return
            }
            let sessionManager = SessionManager()
            sessionManager.saveUserLogin()
            self.performSegue(withIdentifier: "SignInToHome", sender: nil)
        }
    }
}

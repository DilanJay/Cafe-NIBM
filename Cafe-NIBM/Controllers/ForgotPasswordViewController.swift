//
//  ForgotPasswordViewController.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-05-08.
//

import UIKit
import Firebase
import Loaf

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func btnSend(_ sender: UIButton) {
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: txtEmail.text!) { (error) in
            if let err = error {
                Loaf("\(err)", state: .error, sender: self).show()
                return
            }
        }
    }
    
}

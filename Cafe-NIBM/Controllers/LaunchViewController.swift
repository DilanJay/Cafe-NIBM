//
//  LaunchViewController.swift
//  Cafe-NIBM
//
//  Created by Dilan Pramodya on 2021-04-30.
//

import UIKit

class LaunchViewController: UIViewController {
    
    let sessionManager = SessionManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if sessionManager.getLoggedStatus() {
            self.performSegue(withIdentifier: "LaunchToHome", sender: nil)
        } else {
            self.performSegue(withIdentifier: "LaunchToSignIn", sender: nil)
        }
    }
}

//
//  SignInViewController.swift
//  snapchat
//
//  Created by ziad adra on 1/24/17.
//  Copyright © 2017 ziad adra. All rights reserved.
//

import UIKit
import Firebase


class SighnInViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func turnupTapped(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            print ("We Tried to Sign in ")
            if error != nil {
                print ("Hey we have error:\(error)")
                
            } else {
                print ("Signed in Succesfully")
                
            }
        })
        
    }
    
    
    
}


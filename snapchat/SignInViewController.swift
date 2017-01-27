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
        //     FIRDatabase.database().reference().child("Hello").setValue("I m Cool")
        
    }
    
    @IBAction func turnupTapped(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            print ("We Tried to Sign in ")
            if error != nil {
                print ("Hey we have error:\(error)")
                
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    
                    print("we are  creating user ")
                    if error != nil {
                        print ("Hey we have error:\(error)")
                    } else {
                        //  print("User created ")
                        
                        print ("Signed in Succesfully")
                        FIRDatabase.database().reference().child("users").child(user!.uid).child("Email").setValue(user!.email!)
                        
                        
                        
                        
                        
                        
                        
                        
                        self.performSegue(withIdentifier: "signinsegue", sender: nil)
                    }
                    
                })
                
            } else {
                print ("Signed in Succesfully")
                self.performSegue(withIdentifier: "signinsegue", sender: nil)
                
            }
        })
        
    }
    
    
    
}


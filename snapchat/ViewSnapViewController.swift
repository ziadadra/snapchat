//
//  ViewSnapViewController.swift
//  snapchat
//
//  Created by ziad adra on 1/28/17.
//  Copyright © 2017 ziad adra. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase


class ViewSnapViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
 
    //set up a place to receive the snap
    var snap = Snap()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = snap.descrip
        imageView.sd_setImage(with: URL(string: snap.imageURL))
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        FIRDatabase.database().reference().child("users").child((FIRAuth.auth()?.currentUser?.uid)!).child("snaps").child(snap.key).removeValue()
        FIRStorage.storage().reference().child("images").child("\(snap.uuid).jpg").delete { (error) in
            print("we delete the pic")
        }
        
    }
    

   

}

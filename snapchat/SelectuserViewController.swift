//
//  SelectuserViewController.swift
//  snapchat
//
//  Created by ziad adra on 1/27/17.
//  Copyright © 2017 ziad adra. All rights reserved.
//

import UIKit
import Firebase


class SelectuserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var users : [User] = []
    var imageURL = ""
    var descrip = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        
        self.tableView.delegate = self
        
        FIRDatabase.database().reference().child("users").observe(FIRDataEventType.childAdded, with: {(snapshot) in
            print(snapshot)
          
            
            
            let user = User()
            
          
            
            user.email = (snapshot.value! as AnyObject)["Email"] as! String
            
            user.uid = snapshot.key
            
            self.users.append(user)
            self.tableView.reloadData()
            
            
            
            
        }
        )
       
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell()
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.email
        
        
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        
        let snap = ["From":user.email,"Description":descrip,"ImageUrl":imageURL]
        
        FIRDatabase.database().reference().child("users").child(user.uid).child("snaps").childByAutoId().setValue(snap)
        
        
        
        
    }
  

}

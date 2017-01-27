//
//  SnapsViewController.swift
//  snapchat
//
//  Created by ziad adra on 1/26/17.
//  Copyright © 2017 ziad adra. All rights reserved.
//

import UIKit
import Firebase

class SnapsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
   
    var snaps : [Snap] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
        FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").observe(FIRDataEventType.childAdded, with: {(snapshot) in
            print(snapshot)
            
            
            
            let snap = Snap()
            
            
            
            snap.imageURL = (snapshot.value! as AnyObject)["ImageUrl"] as! String
            
            snap.from = (snapshot.value! as AnyObject)["From"] as! String
           snap.descrip = (snapshot.value! as AnyObject)["Description"] as! String
            
            self.snaps.append(snap)
            self.tableView.reloadData()
            
            
            
            
        }
        )
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snaps.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let snap = snaps[indexPath.row]
        cell.textLabel?.text = snap.from
        
        return cell
    }
    @IBAction func logoutTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   

}

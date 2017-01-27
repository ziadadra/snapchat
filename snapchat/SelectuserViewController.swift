//
//  SelectuserViewController.swift
//  snapchat
//
//  Created by ziad adra on 1/27/17.
//  Copyright © 2017 ziad adra. All rights reserved.
//

import UIKit

class SelectuserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        
        self.tableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
  

}

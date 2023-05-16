//
//  PersonListViewController.swift
//  MVCtoMVVMtoMVP
//
//  Created by Azam Mukhtar on 15/05/23.
//

import UIKit

class PersonListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "PersonCell")
        var content = cell.defaultContentConfiguration()
        
        content.image = UIImage(systemName: "star.fill")
        content.text = "Person name"
        content.secondaryText = "Age \(12)"
        
        cell.contentConfiguration = content
        
        return cell
    }
    
}


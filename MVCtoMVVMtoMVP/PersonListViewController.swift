//
//  PersonListViewController.swift
//  MVCtoMVVMtoMVP
//
//  Created by Azam Mukhtar on 15/05/23.
//

import UIKit

class PersonListViewController: UITableViewController {
    
    private var persons: [Person] = [
        Person(name: "Person 1", age: 23, image: UIImage(systemName: "person")!),
        Person(name: "Person 2", age: 12, image: UIImage(systemName: "star")!),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "PersonCell")
        var content = cell.defaultContentConfiguration()
        
        let person = persons[indexPath.row]
        content.image = person.image
        content.text = person.name
        content.secondaryText = "Age \(person.age)"
        
        
        cell.contentConfiguration = content
        
        return cell
    }
    
}


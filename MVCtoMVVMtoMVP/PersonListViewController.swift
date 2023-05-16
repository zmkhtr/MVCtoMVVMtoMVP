//
//  PersonListViewController.swift
//  MVCtoMVVMtoMVP
//
//  Created by Azam Mukhtar on 15/05/23.
//

import UIKit

class PersonListViewController: UITableViewController {
    
    private let loader = PersonLoader()
    private var persons: [Person] = []
    
    public lazy var refreshController: UIRefreshControl = {
        let refreshControl = UIRefreshControl(frame: .zero)
        refreshControl.addTarget(self, action: #selector(self.load), for: .valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.refreshControl = refreshController

        load()
    }
    
    @objc func load() {
        tableView.refreshControl?.beginRefreshing()
        loader.load { [weak self] result in
            guard let self = self else { return }
            self.tableView.refreshControl?.endRefreshing()
            switch result {
            case let .success(persons):
                self.persons = persons
                self.tableView.reloadData()
            case let .failure(error):
                print("Handle \(error)")
            }
        }
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


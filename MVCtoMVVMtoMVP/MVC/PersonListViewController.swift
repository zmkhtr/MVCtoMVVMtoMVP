//
//  PersonListViewController.swift
//  MVCtoMVVMtoMVP
//
//  Created by Azam Mukhtar on 15/05/23.
//

import UIKit

class PersonListViewController: UITableViewController {
    
    private let viewModel = PersonViewModel()
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
        viewModel.load()
    }
    
    private func showErrorAlert(errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
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


//
//  PersonListViewController.swift
//  MVCtoMVVMtoMVP
//
//  Created by Azam Mukhtar on 15/05/23.
//

import UIKit

class PersonListViewController: UITableViewController {
    
    private let presenter = PersonPresenter()
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

        presenter.delegate = self
        load()
    }
    
    @objc func load() {
        presenter.load()
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

extension PersonListViewController: PersonViewDelegate {
    func onLoadingStateChange(isLoading: Bool) {
        isLoading ? tableView.refreshControl?.beginRefreshing() : tableView.refreshControl?.endRefreshing()
    }

    func onErrorStateChange(error: String?) {
        if let error {
            showErrorAlert(errorMessage: error)
        }
    }

    func onPersonsLoad(persons: [Person]) {
        self.persons = persons
        self.tableView.reloadData()
    }
}

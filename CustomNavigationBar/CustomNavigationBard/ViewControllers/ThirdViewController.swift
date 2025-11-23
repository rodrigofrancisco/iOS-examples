//
//  ThirdViewController.swift
//  CustomNavigationBard
//
//  Created by RODRIGO FRANCISCO PABLO on 28/11/24.
//

import UIKit

class ThirdViewController: UIViewController {
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        let safeArea = view.layoutMarginsGuide
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.dataSource = self
        
        let visibleViewController = self
        let appearance = UINavigationBarAppearance(theme: .primary)
        visibleViewController.navigationItem.standardAppearance = appearance
        visibleViewController.navigationItem.scrollEdgeAppearance = appearance
        visibleViewController.navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.
    }
}

extension ThirdViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Another third cell"
        
        return cell
    }
}


//
//  MainViewController.swift
//  CustomNavigationBard
//
//  Created by RODRIGO FRANCISCO PABLO on 25/11/24.
//

import UIKit


final class SampleDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Some content in a cell"
        
        return cell
    }
}

final class MainViewController: UIViewController {
    
    private let tableView = UITableView()
    private let dataSource = SampleDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "An E-commerce"
        self.configurateNavigationBar()
        self.setupTableView()
    }

    private func configurateNavigationBar() {
        let visibleViewController = self
        let appearance = UINavigationBarAppearance(theme: .primary)
        visibleViewController.navigationItem.standardAppearance = appearance
        visibleViewController.navigationItem.scrollEdgeAppearance = appearance
        visibleViewController.navigationItem.compactAppearance = appearance
    }
    
    private func setupTableView() {
        tableView.dataSource = dataSource
        tableView.delegate = self
        let safeArea = view.layoutMarginsGuide
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navbarTopView(.show)
        let bag = UIBarButtonItem(image: UIImage(systemName: "bag"), style: .plain, target: nil, action: nil)
        self.navigationItem.setRightBarButtonItems([bag], animated: false)
        self.navigationController?.addBottomPadding()
        
    }
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        self.navigationController?.toggleTopView(baseOn: scrollView)
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ThirdViewController()
        self.navigationController?.pushViewController(vc, animated: true)

    }
}


//
//  OrderDetailsVC.swift
//  NootropicsSubscriptionBox
//
//  Created by Rick Jacobson on 2/25/21.
//

import UIKit


// Another table view. They're kinda nice.
class OrderDetailsVC: UIViewController {
    
    var currentOrder: Order!
    
    var orderContent: [Supplement] = []
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(PastOrderTVCell.self, forCellReuseIdentifier: "cell")
        
        // TODO: One day find a way and a reason to have the delegate or data source be somewthing other than 'self'. Probably when I'm actually fetching items from a persistent storage source instead of hard coding them.
        tableView.delegate = self
        tableView.dataSource = self

        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // Want to get used to using NSLayoutConstraint.activate
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

}

extension OrderDetailsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // One row per item in order
        return currentOrder.contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PastOrderTVCell
        // Fill cell with one supplement and its name (but actually one category+name for now)
        cell.setupAsItemCell(supp: currentOrder.contents[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Picking at random
        return 80
    }
}

//
//  PastOrderVC.swift
//  NootropicsSubscriptionBox
//
//  Created by Rick Jacobson on 2/24/21.
//

import UIKit

class PastOrdersVC: UIViewController {
    
    let tableView = UITableView()
    
    var pastOrders: [Order] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        tableView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
    }
    

}

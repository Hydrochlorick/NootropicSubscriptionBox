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

        setupTableView()
    }
    

    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),    // Pretty sure this was how Adriana did it when I lasted checked out the example box. Might need to be double checked
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    func setupOrderHistory() {
        // TODO This is redundant right now because I'm treating each Supplement "type" like its own distinct item, instead of as a category for the items.
        let adapt = SuppCategory(title: "Adaptogens", image: UIImage(named: SuppType.adaptogen.rawValue)!)
        let choline = SuppCategory(title: "Choline", image: UIImage(named: SuppType.choline.rawValue)!)
        let energy = SuppCategory(title: "Energy", image: UIImage(named: SuppType.energy.rawValue)!)
        let mito = SuppCategory(title: "Mitochondrial Support", image: UIImage(named: SuppType.mito.rawValue)!)
        let mush = SuppCategory(title: "Mushroom", image: UIImage(named: SuppType.mushrooms.rawValue)!) // Still don't think I see what some folks see in these mushroom products. I don't think I ever noticed a difference. Reminder to look up research on that every once in a while to see where it's going.
        let noot = SuppCategory(title: "Nootropics", image: UIImage(named: SuppType.noot.rawValue)!)

        let orderHistory = [
            Order(month: "October 2020", contents: [adapt, energy], image: UIImage(named: "nootropitcsBigN")!),
            Order(month: "November 2020", contents: [noot, energy], image: UIImage(named: "nootropitcsBigN")!),
            Order(month: "December 2020", contents: [noot, mito], image: UIImage(named: "nootropitcsBigN")!),
            Order(month: "January 2021", contents: [noot, mush, choline], image: UIImage(named: "nootropitcsBigN")!),
            Order(month: "February 2021", contents: [noot, choline], image: UIImage(named: "nootropitcsBigN")!),
        ]
        
        // Later on this will obviously be filled a different way
        for order in orderHistory {
            pastOrders.append(order)
        }

    }
    
}

extension PastOrdersVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    
    
}

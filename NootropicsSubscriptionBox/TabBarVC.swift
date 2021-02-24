//
//  TabBarVC.swift
//  NootropicsSubscriptionBox
//
//  Created by Rick Jacobson on 2/21/21.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        
        let homeVC = HomeVC()
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill") )
        
        let newStackVC = NewStackVC()
        let newStackNav = UINavigationController(rootViewController: newStackVC)
        newStackVC.tabBarItem = UITabBarItem(title: "Order", image: UIImage(systemName: "shippingbox"), selectedImage: UIImage(systemName: "shippingbox.fill"))
        
        viewControllers = [homeNav, newStackNav]
    }
 
}

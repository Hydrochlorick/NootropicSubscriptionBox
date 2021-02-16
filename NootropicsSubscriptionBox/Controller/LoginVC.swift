//
//  LoginVC.swift
//  NootropicsSubscriptionBox
//
//  Created by Rick Jacobson on 2/8/21.
//

import UIKit

class LoginVC: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pageStack: UIStackView = {
            let pageStack = UIStackView()
            pageStack.axis = .vertical
            pageStack.spacing = 20
            pageStack.distribution = .fill
            pageStack.translatesAutoresizingMaskIntoConstraints = false
            return pageStack
        }()
        
//        let usernameField: UITextField = {
//            let usernameField = UITextField()
//            usernameField.translatesAutoresizingMaskIntoConstraints = false
//            return usernameField
//        }
        
        view.addSubview(pageStack)
        pageStack.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6).isActive = true
        pageStack.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6).isActive = true
        pageStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pageStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

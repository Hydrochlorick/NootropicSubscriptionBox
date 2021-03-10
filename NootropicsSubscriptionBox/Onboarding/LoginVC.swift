//
//  LoginVC.swift
//  NootropicsSubscriptionBox
//
//  Created by Rick Jacobson on 2/8/21.
//

import UIKit

class LoginVC: UIViewController {
    
    let pageStack: UIStackView = {
        let pageStack = UIStackView()
        pageStack.axis = .vertical
        pageStack.spacing = 20
        pageStack.distribution = .fill
        pageStack.translatesAutoresizingMaskIntoConstraints = false
        return pageStack
    }()
    
    let pageImage: UIImageView = {
        let pageImage = UIImageView()
        pageImage.contentMode = .scaleAspectFit
        pageImage.translatesAutoresizingMaskIntoConstraints = false
        pageImage.image = UIImage(systemName: "scribble.variable")
        return pageImage
    }()
    
    let usernameField: UITextField = {
        let usernameField = UITextField()
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        usernameField.placeholder = "Username"
        return usernameField
    }()
    
    let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.placeholder = "Password"
        return passwordField
    }()
    
    let loginButton: UIButton = {
       let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor.blue
        loginButton.setTitleColor(.white, for: .normal)
        return loginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupPageStack()
        loginButton.addTarget(self, action: #selector(homeSegue), for: .touchUpInside)
    }
    
    func setupPageStack() {
        self.view.addSubview(pageStack)
        pageStack.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6).isActive = true
        pageStack.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6).isActive = true
        pageStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pageStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        pageStack.addArrangedSubview(pageImage)
        pageStack.addArrangedSubview(usernameField)
        pageStack.addArrangedSubview(passwordField)
        pageStack.addArrangedSubview(loginButton)
    }
    
    @objc func homeSegue() {
        let tabVC = TabBarVC()
        self.navigationController?.pushViewController(tabVC, animated: true)
    }

}

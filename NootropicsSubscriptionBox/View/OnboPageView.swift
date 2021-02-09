//
//  OnboPageView.swift
//  NootropicsSubscriptionBox
//
//  Created by Rick Jacobson on 2/3/21.
//

import UIKit

class OnboPageView: UIView {
    var message: String? = "BOOO"
    var imageName: String? = "JKKKK"
    var pageColor: UIColor? = .darkGray
    var isLastPage: Bool? = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    convenience init(message: String, imageName: String, pageColor: UIColor, isLastPage: Bool) {
        self.init()
        self.message = message
        self.imageName = imageName
        self.pageColor = pageColor
        self.isLastPage = isLastPage
        setup()
    }
    
    private func setup() {
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
            return pageImage
        }()
        
        let pageMessage: UILabel = {
            let pageMessage = UILabel()
            pageMessage.numberOfLines = 0
            pageMessage.textAlignment = .center
            pageMessage.font = UIFont(name: "Helvetica", size: 20)
            pageMessage.textColor = UIColor(white: 1.0, alpha: 0.8)
            return pageMessage
        }()
        // Add the stack to the new page, then add constraints
        self.addSubview(pageStack)
        pageStack.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, multiplier: 0.6).isActive = true
        pageStack.heightAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, multiplier: 0.6).isActive = true
        pageStack.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pageStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        pageStack.addArrangedSubview(pageImage)
        pageStack.addArrangedSubview(pageMessage)

        if isLastPage == true {
            let startButton: UIButton = {
               let startButton = UIButton()
                startButton.setTitle("I'm Ready!", for: .normal)
                startButton.backgroundColor = UIColor.white
                startButton.setTitleColor(UIColor.darkGray, for: .normal)
                return startButton
            }()
            pageStack.addArrangedSubview(startButton)
        }

        pageImage.image = UIImage(named: imageName!)
        pageMessage.text = message
        self.backgroundColor = pageColor
    }
}

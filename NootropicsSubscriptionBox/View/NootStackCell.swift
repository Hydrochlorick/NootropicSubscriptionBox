//
//  NootStackCell.swift
//  NootropicsSubscriptionBox
//
//  Created by Rick Jacobson on 2/21/21.
//

import UIKit

class NootStackCell: UICollectionViewCell {
    
    static var cellIdentified: String = "NootStack"
//    var backView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .clear
//        return view
//    }()
    
    var textLabel: UILabel = {
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = UIColor(named: "white")
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        self.contentView.layer.cornerRadius = 15
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = .blue
//        self.contentView.addSubview(backView)
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textLabel)
       
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.6),
            imageView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            textLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
      
    }
    
    func setContent(supp: SuppType){
        imageView.image = UIImage(named: "\(supp.rawValue)")
        textLabel.text = "\(supp.rawValue)"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
  
    func selectionChanged(selected: Bool){
        if selected {
            self.contentView.backgroundColor = UIColor(named: "purple")
        }else{
            self.contentView.backgroundColor = UIColor(named: "grey")

        }
    }
    
}


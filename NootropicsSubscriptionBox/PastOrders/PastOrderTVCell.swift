//
//  PastOrderCell.swift
//  NootropicsSubscriptionBox
//
//  Created by Rick Jacobson on 2/24/21.
//

import UIKit

class PastOrderTVCell: UITableViewCell {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
    let orderTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "Helvetica", size: 20)
        // Because all the design people keep saying dark gray > black
        title.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let itemImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    func setupCell() {
        contentView.addSubview(stackView)
        
        // All the stackView constraints at once because we're fancy
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.85),
            stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        // But not always fancy
        stackView.addArrangedSubview(itemImage)
        itemImage.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.25).isActive = true
        
        stackView.addArrangedSubview(orderTitle)
        orderTitle.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.55).isActive = true
    }
    
    // Make two functions for setting TableViewCell up. One to show an order, one to show a supplement item.
    
    // This is using the default image and text label included in a TableView cell.
    // Theory: This would work even if I removed pretty much everything else on this page
    func setupAsOrderCell(order: Order) {
        imageView?.image = order.image
        textLabel?.text = order.month
    }
    
    // This is using the UI elements that we instantiated above. We didn't have to make a custom cell, really, but at least we know how.
    func setupAsItemCell(supp: SuppCategory) {
        itemImage.image = supp.image
        orderTitle.text = supp.title
    }



    override func awakeFromNib() {
        super.awakeFromNib()
        // Idk what this is, but it has to be here, apparently
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        self.backgroundColor = .lightGray
//        TODO: Figure out why this is working the opposite of as intended
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        // One day we'll learn wtf this is
        // Could also do super.init(coder: coder) here, but I think I'd rather leave it and maybe one day bump into whatever actually calls it this way.
    }

}

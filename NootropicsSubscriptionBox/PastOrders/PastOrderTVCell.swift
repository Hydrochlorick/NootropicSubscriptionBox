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
        // Because dark gray > black, apparently
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
    
    // Make a function for setting TableViewCell up to show an order vs. setting it up to show a supplement item so it can be resused.
    // Gonna do each of these a different way so I can adequately forget how I've done both of them, but then probably solidify at least one  next time I do this
    func setupAsItemCell(supp: SuppCategory) {
        itemImage.image = supp.image
        orderTitle.text = supp.title
    }
    
    // This is using the default image and text label included in the cell. We didn't actually need to make our own for this project, but likely will eventually.
    func setupAsOrderCell(order: Order) {
        textLabel?.text = order.month
        imageView?.image = order.image
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Idk what this is, but it has to be here, apparently
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = .darkGray
        // TODO Think I saw this in Adriana's project. Cross that bridge when we come to it.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        // One day we'll learn wtf this is
    }

}

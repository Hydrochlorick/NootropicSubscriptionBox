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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // TODO Saw this in Adriana's project. Cross that bridge when we come to it.
    }

}

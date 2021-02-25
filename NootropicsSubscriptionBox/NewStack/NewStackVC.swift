//
//  NewStackVC.swift
//  NootropicsSubscriptionBox
//
//  Created by Rick Jacobson on 2/21/21.
//

import UIKit

class NewStackVC: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .lightGray
        collectionView.allowsMultipleSelection = true
        
        collectionView.register(NootStackCell.self, forCellWithReuseIdentifier: "nootCell")

        return collectionView
    }()
        

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Order"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupCollectionView()
        
        view.backgroundColor = .cyan
    }
    
    func setupCollectionView() {
        
        self.view.addSubview(collectionView)
        
        collectionView.widthAnchor.constraint(equalTo: self.view.layoutMarginsGuide.widthAnchor, multiplier: 1.0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.view.layoutMarginsGuide.heightAnchor, multiplier: 1.0).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerYAnchor).isActive = true
    }


}

extension NewStackVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SuppType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nootCell", for: indexPath) as? NootStackCell
        let supp = SuppType.allCases[indexPath.item].rawValue
        cell?.data = SuppCategory(title: supp, image: UIImage(named: supp)!)
        return cell!
    }
    
    
}

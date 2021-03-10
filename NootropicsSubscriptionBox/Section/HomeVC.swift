//
//  HomeVC.swift
//  NootropicsSubscriptionBox
//
//  Created by Rick Jacobson on 2/8/21.
//

import UIKit

class HomeVC: UIViewController {
    
//    let blabel: UILabel = {
//        let blabel = UILabel()
//        blabel.font = UIFont(name: "Helvetica", size: 30)
//        blabel.text = "Where the heart is. So what do I do with this empty chest?"
//        blabel.translatesAutoresizingMaskIntoConstraints = false
//        return blabel
//    }()

    var collectionView: UICollectionView!
    
    lazy var sections: [Section] = [
        TitleSection(title: "Featured Categories"),
        BasicGridSection(),
        TitleSection(title: "Last Month's Favorites"),
        FavoritesSection()
    ]
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        var sections = self.sections
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return sections[sectionIndex].layoutSection()
        }
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Compositional Layout"
        self.view.backgroundColor = UIColor.white
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UINib(nibName: "TitleCell", bundle: .main), forCellWithReuseIdentifier: TitleCell.identifier)
        collectionView.register(UINib(nibName: "FavoritesCell", bundle: .main), forCellWithReuseIdentifier: FavoritesCell.identifier)
        collectionView.register(UINib(nibName: "GridCell", bundle: .main), forCellWithReuseIdentifier: GridCell.identifier)
        self.view.addSubview(collectionView)
        collectionView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.reloadData()
    }
}

extension HomeVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
    }
}

extension HomeVC: UICollectionViewDelegate {}

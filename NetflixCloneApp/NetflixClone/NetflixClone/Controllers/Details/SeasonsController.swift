//
//  SeasonsController.swift
//  NetflixClone
//
//  Created by Moe on 18/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class HorizontalSeasonsController: HorizontalCollectionViewController {
    
    // MARK: - Properties
    fileprivate let seasonCellId = "seasonCellId"
    let seasonsDataSource = SeasonsDataSource()

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .clear
        collectionView.register(HorizontalSeasonCell.self, forCellWithReuseIdentifier: seasonCellId)
        collectionView.bounces = true
        collectionView.alwaysBounceHorizontal = true
        collectionView.dataSource = seasonsDataSource
        collectionView.allowsSelection = true
        let selectedItem = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedItem, animated: false, scrollPosition: .centeredHorizontally)
//        collectionView.indexPathsForSelectedItems
        
        setupView()
    }
    
    
    func setupView() {
        let redView = UIView()
        redView.backgroundColor = .red
        redView.constrainHeight(constant: 10)
        redView.constrainWidth(constant: 80)
        collectionView.addSubview(redView)
        redView.anchor(top: collectionView.topAnchor, leading: collectionView.leadingAnchor, bottom: nil, trailing: collectionView.trailingAnchor)
    }
}


// MARK: - Delegate Flow Layout
extension HorizontalSeasonsController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 80, height: 30)
    }
}

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

    var didSelect: ((Int) -> ())?
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .clear
        collectionView.register(HorizontalSeasonCell.self, forCellWithReuseIdentifier: seasonCellId)
        collectionView.bounces = true
        collectionView.alwaysBounceHorizontal = true
        collectionView.dataSource = seasonsDataSource
        collectionView.allowsSelection = true
//
//        let selectedItem = IndexPath(item: 0, section: 0)
//        collectionView.selectItem(at: selectedItem, animated: false, scrollPosition: .centeredHorizontally)
        //        collectionView.indexPathsForSelectedItems
        
//        setupView()
    }

    
    var leadingCons: NSLayoutConstraint?
    
    func setupView() {
        let redView = UIView()
        redView.backgroundColor = .red
        collectionView.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = true
        
        redView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leadingCons = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        leadingCons?.isActive = true
        redView.constrainHeight(constant: 10)
        redView.constrainWidth(constant: 80)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let x = CGFloat(indexPath.item) * view.frame.width / CGFloat(seasonsDataSource.seasons.count)
//        print(seasonsDataSource.seasons.count)
//        print(indexPath.item)
//        self.leadingCons?.constant = x
//        UIView.animate(withDuration: 0.5) {
//            self.view.layoutIfNeeded()
//        }
        
        guard let seasonNumber = seasonsDataSource.seasons[indexPath.item].seasonNumber else { return }
        didSelect?(seasonNumber)
    }
}


// MARK: - Delegate Flow Layout
extension HorizontalSeasonsController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: 80, height: 30)
    }
}

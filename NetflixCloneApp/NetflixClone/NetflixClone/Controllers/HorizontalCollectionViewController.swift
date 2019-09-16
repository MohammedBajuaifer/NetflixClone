//
//  HorizontalCollectionViewController.swift
//  NetflixClone
//
//  Created by Moe on 12/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//


import UIKit

class HorizontalCollectionViewController: UICollectionViewController {
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  MainListController.swift
//  NetflixClone
//
//  Created by Moe on 03/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class MainListController: UICollectionViewController {
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
//        collectionView.alwaysBounceVertical = true
//        collectionView.bounces = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

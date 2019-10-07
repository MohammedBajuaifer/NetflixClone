//
//  LatestTvShowHeaderCell.swift
//  NetflixClone
//
//  Created by Moe on 18/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class LatestTvShowHeaderCell: UICollectionReusableView {
    
    let latestTvShowController = LatestTvShowController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        poster.layer.cornerRadius = 8
        
        addSubview(latestTvShowController.view)
        latestTvShowController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  EpisodeCell.swift
//  NetflixClone
//
//  Created by Moe on 25/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class EpisodeCell: UICollectionViewCell {
    
    let episodeController = EpisodeController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // UI Setup
        backgroundColor = .yellow
        addSubview(episodeController.view)
        episodeController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

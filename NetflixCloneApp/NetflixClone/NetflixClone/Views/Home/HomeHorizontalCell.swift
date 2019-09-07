//
//  HomeHorizontalCell.swift
//  NetflixClone
//
//  Created by Moe on 03/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class HomeHorizontalCell: UICollectionViewCell {
    
    let label = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // UI Setup
        label.contentMode = .scaleAspectFill
        label.clipsToBounds = true
        addSubview(label)
        label.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

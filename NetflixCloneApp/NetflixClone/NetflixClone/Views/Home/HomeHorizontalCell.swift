//
//  HomeHorizontalCell.swift
//  NetflixClone
//
//  Created by Moe on 03/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class HomeHorizontalCell: UICollectionViewCell {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // UI Setup
        label.text = "This"
        addSubview(label)
        label.centerInSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

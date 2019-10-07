//
//  TvShowHeader.swift
//  NetflixClone
//
//  Created by Moe on 18/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class TvShowHeader: UICollectionViewCell {
    
    let poster = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        poster.contentMode = .scaleAspectFill
        poster.layer.cornerRadius = 8
        addSubview(poster)
        poster.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

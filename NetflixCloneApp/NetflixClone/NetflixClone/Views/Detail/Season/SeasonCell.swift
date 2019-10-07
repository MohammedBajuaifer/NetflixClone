//
//  SeasonCell.swift
//  NetflixClone
//
//  Created by Moe on 18/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class SeasonCell: UICollectionViewCell {
    
    let seasonsController = HorizontalSeasonsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        addSubview(seasonsController.view)
        seasonsController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

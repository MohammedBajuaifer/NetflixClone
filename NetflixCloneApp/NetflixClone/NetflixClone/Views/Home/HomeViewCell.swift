//
//  HomeViewCell.swift
//  NetflixClone
//
//  Created by Moe on 03/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class HomeViewCell: UICollectionViewCell {
    
    let homeHorizontalController = HomeHorizontalController()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .yellow
        
        addSubview(homeHorizontalController.view)
        
        homeHorizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        
        homeHorizontalController.view.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
          homeHorizontalController.view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
          homeHorizontalController.view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
          homeHorizontalController.view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

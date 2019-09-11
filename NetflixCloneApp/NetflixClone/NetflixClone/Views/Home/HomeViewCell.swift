//
//  HomeViewCell.swift
//  NetflixClone
//
//  Created by Moe on 03/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class HomeViewCell: UICollectionViewCell {
    
    
    let title = UILabel()
    let homeHorizontalController = HomeHorizontalController()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title.textColor = .white
        title.font = UIFont(name: "Roboto-Bold", size: 16)
//        title.font = UIFont.boldSystemFont(ofSize: 18)
        addSubview(title)
        addSubview(homeHorizontalController.view)
        
        
        title.anchor(top: topAnchor, leading: leadingAnchor, bottom: homeHorizontalController.view.topAnchor, trailing: nil, padding: .init(top: 10, left: 10, bottom: 5, right: 0))
        
        homeHorizontalController.view.anchor(top: title.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 5, left: 10, bottom: 10, right: 10))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

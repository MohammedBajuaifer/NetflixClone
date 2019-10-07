//
//  HorizontalSeasonCell.swift
//  NetflixClone
//
//  Created by Moe on 23/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class HorizontalSeasonCell: UICollectionViewCell {
    
    let seasonLabel = UILabel(text: "Season", font: .boldSystemFont(ofSize: 16), numberOfLines: 1, textColor: .black)

    override var isHighlighted: Bool {
        didSet {
            seasonLabel.backgroundColor = isHighlighted ? .red : .clear
        }
    }
    override var isSelected: Bool {
        didSet {
            seasonLabel.backgroundColor = isSelected ? .red : .clear
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
              
        // UI Setup
        addSubview(seasonLabel)
        seasonLabel.fillSuperview()
        backgroundColor = .gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  EpisodeInfoCell.swift
//  NetflixClone
//
//  Created by Moe on 07/10/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class EpisodeInfoCell: UICollectionViewCell {
    
    let label = UILabel(text: "EpisodeLabel", font: .boldSystemFont(ofSize: 20), numberOfLines: 0, textColor: .black)
    let episodeImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        addSubview(episodeImageView)
        
        label.textAlignment = .center
        episodeImageView.contentMode = .scaleAspectFill
        episodeImageView.layer.cornerRadius = 5
        episodeImageView.clipsToBounds = true
        //        addSubview(label)
        //        addSubview(episodeImageView)
        //
        //        label.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        //        label.constrainHeight(constant: 30)
        //
        //        episodeImageView.anchor(top: label.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 30, bottom: 20, right: 30))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        label.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        label.constrainHeight(constant: 30)
        episodeImageView.anchor(top: label.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 30, bottom: 20, right: 30))
    }
}

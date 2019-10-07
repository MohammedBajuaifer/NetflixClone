//
//  MovieTvCell.swift
//  NetflixClone
//
//  Created by Moe on 12/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class MovieTvCell: UICollectionViewCell {
    
    let movieTVTitle = UILabel(text: "Movie/TV Title", font: .boldSystemFont(ofSize: 16), numberOfLines: 1, textColor: .white)
    
    let movieTVPoster: UIImageView = {
        let poster = UIImageView()
        poster.contentMode = .scaleAspectFill
        poster.constrainHeight(constant: 200)
        poster.constrainWidth(constant: 100)
        return poster
    }()
    
    let movieTVBackgroupPoster: UIImageView = {
        let poster = UIImageView()
        poster.addBlurEffect()
        poster.contentMode = .scaleAspectFill
        poster.alpha = 0.3
        return poster
    }()
    
    let releaseDate = UILabel(text: "2017", font: .systemFont(ofSize: 14), numberOfLines: 1, textColor: .lightGray)
    let forWhom = UILabel(text: "+16", font: .systemFont(ofSize: 14), numberOfLines: 1, textColor: .lightGray)
    let duration = UILabel(text: "3 Seasons", font: .systemFont(ofSize: 14), numberOfLines: 1, textColor: .lightGray)
    
    let status = UILabel(text: "Ended", font: UIFont(name: "Roboto-Bold", size: 17)!, numberOfLines: 1, textColor: .white)
    
    let playButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.constrainHeight(constant: 35)
        btn.setTitle("Play", for: .normal)
        // TODO: Set the image
        btn.backgroundColor = UIColor.init(red: 0.8980392157, green: 0.03921568627, blue: 0.07450980392, alpha: 1)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.init(name: "Roboto-Bold", size: 16)
        btn.layer.cornerRadius = 3
        btn.setImage(#imageLiteral(resourceName: "playbutton"), for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        return btn
    }()
    
    let overview = UILabel(text: "A Martinique charter boat skipper gets mixed up with the underground French resistance operatives during WWII.", font: .systemFont(ofSize: 14), numberOfLines: 0, textColor: .white)
    
    let castsInfo = UILabel(text: "Cast: Najwa Nimri, Berta Vazquez, Alba Flores \nCreators: Alex Pina", font: .systemFont(ofSize: 12), numberOfLines: 0, textColor: .lightGray)
    
    
    let addToListButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("My List", for: .normal)
        btn.setTitleColor(.lightGray, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 10)
        btn.setImage(#imageLiteral(resourceName: "addToList"), for: .normal)
        return btn
    }()
    
    let rateButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Rate", for: .normal)
        btn.setTitleColor(.lightGray, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 10)
        btn.setImage(#imageLiteral(resourceName: "rateIcon"), for: .normal)
        return btn
    }()
    
    let shareButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Share", for: .normal)
        btn.setTitleColor(.lightGray, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 10)
        btn.setImage(#imageLiteral(resourceName: "share"), for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        movieTVTitle.constrainWidth(constant: frame.width)
        movieTVTitle.textAlignment = .center
        status.textAlignment = .center
        
        let stackView = UIStackView(arrangedSubviews: [
            releaseDate,
            forWhom,
            duration
        ])
        stackView.distribution = .fill
        stackView.spacing = 10
        
        let verticalStackView = VerticalStackView(arrangedSubviews: [
            status,
            playButton,
            overview,
            castsInfo,
        ], spacing: 10)
        
        let buttonsStackView = UIStackView(arrangedSubviews: [
            addToListButton, rateButton, shareButton, UIView()
        ])
        
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.alignment = .leading
        buttonsStackView.spacing = 10
        
        addSubview(movieTVTitle)
        addSubview(movieTVBackgroupPoster)
        addSubview(movieTVPoster)
        addSubview(stackView)
        addSubview(verticalStackView)
        addSubview(buttonsStackView)
        
        
        movieTVBackgroupPoster.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        movieTVTitle.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        movieTVTitle.constrainHeight(constant: 40)
        
        movieTVPoster.centerXInSuperview()
        movieTVPoster.anchor(top: movieTVTitle.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
        
        stackView.anchor(top: movieTVPoster.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 15, left: 0, bottom: 0, right: 0))
        stackView.centerXInSuperview()
        
        verticalStackView.anchor(top: stackView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 15, bottom: 0, right: 15))

        buttonsStackView.anchor(top: verticalStackView.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
    }
    override func layoutSubviews() {
        addToListButton.centerVertically()
        rateButton.centerVertically()
        shareButton.centerVertically()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

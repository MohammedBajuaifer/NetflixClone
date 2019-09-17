//
//  MovieTVDetailController.swift
//  NetflixClone
//
//  Created by Moe on 12/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class MovieTVDetailController: MainListController {
    
    // MARK: - Properties
    let TvShowsDataSource = TvShowInfoDataSource()
    fileprivate let cellId = "cellId"
    fileprivate let movieTvId: Int
    
    
    // MARK: Initializer
    init(movieTvId: Int) {
        self.movieTvId = movieTvId
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.04700054973, green: 0.05029480904, blue: 0.09337023646, alpha: 1)
        collectionView.register(MovieTvCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.bounces = true
        collectionView.alwaysBounceVertical = true
        TvDataSource()
    }
    
    fileprivate func TvDataSource() {
        TvShowsDataSource.fetch(url: "https://api.themoviedb.org/3/tv/\(movieTvId)?api_key=345cdbdebf696cc58d4dd8ebbef4b1da&language=en-US&append_to_response=similar,credits,content_ratings")
        
        collectionView.dataSource = TvShowsDataSource
        
        TvShowsDataSource.didChangeHandler = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

// MARK: - Delegate Flow Layout
extension MovieTVDetailController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height)
    }
}

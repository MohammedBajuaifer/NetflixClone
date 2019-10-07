//
//  LatestTvShowController.swift
//  NetflixClone
//
//  Created by Moe on 18/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class LatestTvShowController: HorizontalCollectionViewController {
    
    // MARK: - Properties
    
    fileprivate let cellId = "cellId"
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .clear
        collectionView.register(TvShowHeader.self, forCellWithReuseIdentifier: cellId)
    }
}

// MARK: - DataSource & Delegates

extension LatestTvShowController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TvShowHeader
        cell.poster.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/etnfukYKPR8YDFl9vJhQ6EAo9gh.jpg"))
        return cell
    }
}

// MARK: - Delegate Flow Layout

extension LatestTvShowController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 0)
    }
}

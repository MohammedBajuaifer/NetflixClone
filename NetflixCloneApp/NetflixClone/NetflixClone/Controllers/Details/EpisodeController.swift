//
//  EpisodeController.swift
//  NetflixClone
//
//  Created by Moe on 25/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class EpisodeController: MainListController {
    
    // MARK: - Properties
    fileprivate let cellId = "episodeInfoCellId"
    
    var episode: Episode? {
        didSet {
            print("sssss")
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .blue
        collectionView.register(EpisodeInfoCell.self, forCellWithReuseIdentifier: cellId)
    }
}



// MARK: - DataSource & Delegates
extension EpisodeController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return episode?.episodes?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EpisodeInfoCell
        cell.backgroundColor = .purple
        let episodeInfo = episode?.episodes?[indexPath.item]
        cell.episodeImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(episodeInfo?.imagePath ?? "")"))
        cell.label.text = "\(episodeInfo?.name ?? "m")"
        return cell
    }
}

// MARK: - Delegate Flow Layout
extension EpisodeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
}

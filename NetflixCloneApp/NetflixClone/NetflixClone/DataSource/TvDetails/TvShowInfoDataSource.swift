//
//  TvShowInfoDataSource.swift
//  NetflixClone
//
//  Created by Moe on 17/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class TvShowInfoDataSource: NSObject, UICollectionViewDataSource {
    
    // MARK: - Properties
    var result: Result?
    var didChangeHandler: (() -> Void)?
    fileprivate let cellId = "cellId"
    
    func fetch(url: String) {
        Service.shared.fetchMovieTvDetails(url: url) { (result, error) in
            if let error = error {
                print("Error", error)
                return
            }
            DispatchQueue.main.async {
                self.result = result
                self.didChangeHandler?()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieTvCell
        
        if let title = result?.title {
            cell.movieTVTitle.text = title
        }
        
        if let numberOfSeasons = result?.seasons {
            if numberOfSeasons.count <= 1 {
                cell.duration.text = "\(numberOfSeasons.count) Season"
            } else {
                cell.duration.text = "\(numberOfSeasons.count) Seasons"
            }
        }
        
        if let contentRating = result?.contentRatings?.results.map({$0.rating}) {
            if contentRating.first == nil {
                cell.forWhom.text = "+16"
            } else {
                cell.forWhom.text = contentRating.first
            }
        }
        
        let crewNames = result?.credits?.crew.map({$0.name})
        let castNames = result?.credits?.cast.map({$0.name})
        
        if let castNames = castNames, let crewNames = crewNames,  castNames.count >= 1 &&  crewNames.count >= 1 {
            let names = crewNames.prefix(8)
            cell.castsInfo.text = "Casts: \(castNames.joined(separator: ", ")).\n\nCrew: \(names.joined(separator: ", "))."
        } else {
            cell.castsInfo.text = "Casts: \(castNames?.joined(separator: ", ") ?? "")."
        }
        
        cell.overview.text = result?.overview ?? "No overview"
        cell.movieTVBackgroupPoster.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(result?.poster ?? "")"))
        cell.movieTVPoster.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(result?.poster ?? "")"))
        return cell
    }
    
}

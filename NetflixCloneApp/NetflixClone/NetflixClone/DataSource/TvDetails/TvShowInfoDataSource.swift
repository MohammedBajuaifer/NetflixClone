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
    
    //MARK: - Fetching
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
    
    //MARK: - DataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //MARK: - First Cell
        if indexPath.item == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieTvCell
            
            if let title = result?.name {
                cell.movieTVTitle.text = title
            }
            
            
            cell.movieTVBackgroupPoster.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(result?.poster ?? "")"))
            cell.movieTVPoster.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(result?.poster ?? "")"))
            cell.backgroundColor = .black
            
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
            
            if let status = result?.status {
                cell.status.text = status
            }
            
            let crewNames = result?.credits?.crew.map({$0.name})
            let castNames = result?.credits?.cast.map({$0.name})
            
            if let castNames = castNames, let crewNames = crewNames,  castNames.count >= 1 &&  crewNames.count >= 1 {
                let crewNames = crewNames.prefix(8)
                let castCrew = castNames.prefix(8)
                cell.castsInfo.text = "Casts: \(castCrew.joined(separator: ", ")).\n\nCrew: \(crewNames.joined(separator: ", "))."
            } else if let castNames = castNames, let crewNames = crewNames,  castNames.count <= 0 &&  crewNames.count <= 0 {
                cell.castsInfo.text = ""
            } else {
                cell.castsInfo.text = "Casts: \(castNames?.joined(separator: ", ") ?? "")."
            }
            
            if let overview = result?.overview,  overview.count > 300 {
                cell.overview.text = overview.maxLength(length: 300) + "..."
            } else {
                cell.overview.text = result?.overview ?? "No overview"
             }
            return cell
            
        //MARK: - Second Cell ( Season Cell )
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seasonCellId", for: indexPath) as! SeasonCell
            cell.backgroundColor = #colorLiteral(red: 0.09486607462, green: 0.09010479599, blue: 0.08577872068, alpha: 1)
            cell.seasonsController.seasonsDataSource.seasons = result?.seasons ?? []
            let episodeController = EpisodeController()
            cell.seasonsController.didSelect = { seasonNumber in
                let url = "https://api.themoviedb.org/3/tv/\(self.result?.id ?? 1414)/season/\(seasonNumber)?api_key=345cdbdebf696cc58d4dd8ebbef4b1da&language=en-US"
                Service.shared.fetchEpisodes(url: url) { (episode, error) in
                    DispatchQueue.main.async {
                        episodeController.episode = episode
//                        episodeController.collectionView.reloadData()
//                        cell.seasonsController.present(episodeController, animated: true, completion: nil)
                    }
                }
            }
            cell.seasonsController.collectionView.reloadData()
            return cell
            
        //MARK: - Third Cell ( Episode Cell )
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "episodeCellID", for: indexPath) as! EpisodeCell
            cell.backgroundColor = .blue
            return cell
        }
    }
}

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
    
    fileprivate let cellId = "cellId"
    var result: NetflixResults?
    fileprivate let movieTvId: Int
    // MARK: - viewDidLoad
    
    init(movieTvId: Int) {
        self.movieTvId = movieTvId
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.04700054973, green: 0.05029480904, blue: 0.09337023646, alpha: 1)
        collectionView.register(MovieTvCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.bounces = true
        collectionView.alwaysBounceVertical = true
        fetch()
    }
    
    func fetch() {
        let url = "https://api.themoviedb.org/3/tv/\(movieTvId)?api_key=345cdbdebf696cc58d4dd8ebbef4b1da&language=en-US&append_to_response=similar,credits,content_ratings"
        Service.shared.fetchMovieTvDetails(url: url) { (result, error) in
            if let error = error {
                print("Error", error)
                return
            }
            DispatchQueue.main.async {
                self.result = result
                self.collectionView.reloadData()
            }
        }
    }
}

// MARK: - DataSource & Delegates
extension MovieTVDetailController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieTvCell

        if let title = result?.title {
            cell.movieTVTitle.text = title
        } else {
            cell.movieTVTitle.text = result?.name
        }
        
//        let firstAirDate = result?.firstAirDate?.toDate(withFormat: "yyyy-MM-dd")
//        cell.releaseDate.text = firstAirDate?.description
//
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
            cell.castsInfo.text = "Casts: \(castNames.joined(separator: ", "))\n\nCrew: \(names.joined(separator: ", "))"
        } else {
            cell.castsInfo.text = "Casts: \(castNames?.joined(separator: ", ") ?? "")\n"
        }

        cell.overview.text = result?.overview ?? "No overview"
        cell.movieTVBackgroupPoster.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(result?.poster ?? "")"))
        cell.movieTVPoster.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(result?.poster ?? "")"))
        return cell
    }
}

// MARK: - Delegate Flow Layout

extension MovieTVDetailController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height)
    }
}

//
//  SearchDataSource.swift
//  NetflixClone
//
//  Created by Moe on 17/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class SearchDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Properties
    fileprivate let cellId = "cellId"
    var timer: Timer? // used in searchbar to perform delay
    var results = [Result]()
    var didChangeHandler: (() -> Void)?
    var textDidChange: (() -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchViewCell
        
        let result = results[indexPath.item]
        if let image = result.poster {
            cell.imageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(image)"))
        } else {
            cell.imageView.image = #imageLiteral(resourceName: "home")
        }
        return cell
    }
}

extension SearchDataSource: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if !text.isEmpty {
            textDidChange?()
        }
    
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
            
            Service.shared.searchMedia(searchTerm: text) { (netflix, error) in
                self.results = netflix?.results ?? []
                DispatchQueue.main.async {
                    self.didChangeHandler?()
                }
            }
        })
    }
}

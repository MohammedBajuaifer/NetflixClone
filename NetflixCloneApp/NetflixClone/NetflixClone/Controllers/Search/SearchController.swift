//
//  SearchController.swift
//  NetflixClone
//
//  Created by Moe on 11/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit
import Kingfisher
class SearchController: MainListController, UISearchBarDelegate{
    
    // MARK: - Properties
    
    fileprivate let cellId = "cellId"
    var timer: Timer? // used in searchbar to perform delay
    var results = [Result]()
    fileprivate let activityIndicator: UIActivityIndicatorView = {
        let av = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        av.color = .white
        av.startAnimating()
        av.hidesWhenStopped = true
        return av
    }()
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = #colorLiteral(red: 0.09331475943, green: 0.09813781828, blue: 0.1023981199, alpha: 1)
        collectionView.register(SearchViewCell.self, forCellWithReuseIdentifier: cellId)
        navigationItem.title = "NETFLIX"
        searchController()
    }
    
    func searchController() {
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController.self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Enter a Movie/TV Series"
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        
        
        // Colors
        let textFieldInsideSearchBar = searchController.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        searchController.searchBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        view.addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (_) in
            
            Service.shared.searchMedia(searchTerm: searchText) { (netflix, error) in
                self.results = netflix?.results ?? []
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.collectionView.reloadData()
                }
            }
        })
    }
}

// MARK: - DataSource & Delegates
extension SearchController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchViewCell
        
        let result = results[indexPath.item]
        if let image = result.poster {
            cell.imageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(image)"))
        } else {
            cell.imageView.image = #imageLiteral(resourceName: "home")
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let result = results[indexPath.item]
        
        let movieTVDetailController = MovieTVDetailController(movieTvId: result.id)
        
        movieTVDetailController.result = result
        self.present(movieTVDetailController, animated: true)
    }
}

// MARK: - Delegate Flow Layout
extension SearchController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat =  20
        let width = collectionView.frame.size.width - padding
        return CGSize(width: width / 3, height: 180)
    }
}

//
//  SearchController.swift
//  NetflixClone
//
//  Created by Moe on 11/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit
import Kingfisher
class SearchController: MainListController {
    
    // MARK: - Properties
    fileprivate let cellId = "cellId"
    fileprivate var dataSource = SearchDataSource()
    fileprivate var delegate = SearchDelegate()
    
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
        
        dataSource.textDidChange = { [weak self ]in
            self?.view.addSubview(self!.activityIndicator)
            self?.activityIndicator.centerInSuperview()
        }

        collectionView.dataSource = dataSource
        dataSource.didChangeHandler = { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.collectionView.reloadData()
        }
    }
    
    // MARK: - Search Controller
    func searchController() {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = dataSource
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search"
        navigationItem.searchController = search
    }
    
    // MARK: - didSelectItemAt method
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let result = dataSource.results[indexPath.item]
        let movieTVDetailController = MovieTVDetailController(movieTvId: result.id)
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

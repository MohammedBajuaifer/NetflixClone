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
    var results = [NetflixResults]()
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
        
        collectionView.backgroundColor = .clear
        collectionView.register(SearchViewCell.self, forCellWithReuseIdentifier: cellId)
        navigationItem.title = "NETFLIX"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.8980392157, green: 0.03921568627, blue: 0.07450980392, alpha: 1), NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)]
      
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
        textFieldInsideSearchBar?.textColor = UIColor.white
        searchController.searchBar.tintColor = #colorLiteral(red: 0.3836292624, green: 0.4125564396, blue: 0.4528499246, alpha: 1)
        
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
        if let image = result.poster_path {
            cell.imageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(image)"))
        }
        return cell
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

//
//  HomeController.swift
//  NetflixClone
//
//  Created by Moe on 03/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class HomeController: MainListController {
    
    // MARK: - Properties
    
    fileprivate let cellId = "cellId"
    
    let loginBtn = UIBarButtonItem()
    var netflix = [Netflix]()
    
    fileprivate let activityIndicator: UIActivityIndicatorView = {
        let av = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        av.color = .white
        av.startAnimating()
        av.hidesWhenStopped = true
        return av
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        collectionView.register(HomeViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.alwaysBounceVertical = true
        collectionView.bounces = true
        navigationItem.title = "NETFLIX"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.8980392157, green: 0.03921568627, blue: 0.07450980392, alpha: 1), NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)]
        loginBtn.target = self
        loginBtn.action = #selector(handleLoginBtn)
        loginBtn.title = "login"
        
        navigationItem.leftBarButtonItem = loginBtn
        
        view.addSubview(activityIndicator)
        activityIndicator.fillSuperview()
        fetch()
    }
    
    
    @objc func handleLoginBtn() {
        self.present(LoginController(), animated: true, completion: nil)
    }
}

// MARK: - DataSource & Delegates

extension HomeController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return netflix.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeViewCell
        
        let netflixOne = netflix[indexPath.item]
        if let name  = netflixOne.name {
            cell.title.text = name
        } else {
            cell.title.text = "Popular on Netflix"
        }
        cell.homeHorizontalController.netflix = netflixOne
        cell.homeHorizontalController.collectionView.reloadData()
        return cell
    }
}

// MARK: - Delegate Flow Layout

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 240)
    }
}

//MARK: - Fetching data from API
extension HomeController {
    func fetch() {
        
        let dispatchGroup = DispatchGroup()
        var group1 : Netflix?
        var group2 : Netflix?
        var group3 : Netflix?
        var group4 : Netflix?
        var group5 : Netflix?
        
        // Fetching Marval Universe
        dispatchGroup.enter()
        Service.shared.fetchMarvelUniverse { (netflix, error) in
            print("Fetching Marval Universe...")
            dispatchGroup.leave()
            group1 = netflix
        }
        
        // Fetching DC Comics
        dispatchGroup.enter()
        Service.shared.fetchComics { (netflix, error) in
            print("Fetching DC Comics...")
            dispatchGroup.leave()
            group2 = netflix
        }
        
        // Fetching The Avengers
        dispatchGroup.enter()
        Service.shared.fetchTheAvengers { (netflix, error) in
            print("Fetching The Avengers...")
            dispatchGroup.leave()
            group3 = netflix
        }
        
        // Fetching Top Grossing Films
        dispatchGroup.enter()
        Service.shared.fetchTopGrossingFilms { (netflix, error) in
            print("Fetching Top Grossing Films...")
            dispatchGroup.leave()
            group4 = netflix
        }
        
        // Fetching Best Horror Movies
        dispatchGroup.enter()
        Service.shared.fetchBestHorrorMovies { (netflix, error) in
            print("Fetching Best Horror Movies...")
            dispatchGroup.leave()
            group5 = netflix
        }
        
        // Completion
        dispatchGroup.notify(queue: .main){
            print("Finish fetching all Tasks...")
            
            self.activityIndicator.stopAnimating()
            
            if let group = group1 {
                self.netflix.append(group)
            }
            
            if let group = group2 {
                self.netflix.append(group)
            }
            
            if let group = group3 {
                self.netflix.append(group)
            }
            
            if let group = group4 {
                self.netflix.append(group)
            }
            
            if let group = group5 {
                self.netflix.append(group)
            }
            
            self.collectionView.reloadData()
        }
    }
}

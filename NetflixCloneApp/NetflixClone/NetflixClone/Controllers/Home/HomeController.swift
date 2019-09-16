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
    let netflixTitles = ["Top Rated", "Top TV Shows","Popular TV Shows","Airing Today", "On The Air"]
    
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
        
        collectionView.backgroundColor = #colorLiteral(red: 0.09331475943, green: 0.09813781828, blue: 0.1023981199, alpha: 1)
        collectionView.register(HomeViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.alwaysBounceVertical = true
        collectionView.bounces = true
        navigationItem.title = "NETFLIX"
        
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
        
        cell.title.text = netflixTitles[indexPath.item]
        let netflixOne = netflix[indexPath.item]
        cell.homeHorizontalController.netflix = netflixOne
        cell.homeHorizontalController.collectionView.reloadData()
        
        cell.homeHorizontalController.didSelectHandler = { result in
            let movieTVDetailController = MovieTVDetailController(movieTvId: result.id)
            print(result.id)
            self.present(movieTVDetailController, animated: true)
            
        }
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
        
        // Fetching TopRated
        dispatchGroup.enter()
        Service.shared.fetchTopRated { (netflix, error) in
            print("Fetching Marval Universe...")
            dispatchGroup.leave()
            group1 = netflix
        }
        
        // Fetching Top Tv Shows
        dispatchGroup.enter()
        Service.shared.fetchTopTvShows { (netflix, error) in
            if let err = error {
                print(err)
            }
            print("Fetching Top Grossing Films...")
            dispatchGroup.leave()
            group2 = netflix
        }
        
        // Fetching Popular Tv Shows
        dispatchGroup.enter()
        Service.shared.fetchPopularTvShows { (netflix, error) in
            if let err = error {
                print(err)
            }
            print("Fetching Best Horror Movies...")
            dispatchGroup.leave()
            group3 = netflix
        }
        
        // Fetching Airing Today
        dispatchGroup.enter()
        Service.shared.fetchAiringToday { (netflix, error) in
            if let err = error {
                print(err)
            }
            print("Fetching Airing Today...")
            dispatchGroup.leave()
            group4 = netflix
        }
        
        // Fetching OnTheAir
        dispatchGroup.enter()
        Service.shared.fetchOnTheAir { (netflix, error) in
            if let err = error {
                print(err)
            }
            print("Fetching OnTheAir...")
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

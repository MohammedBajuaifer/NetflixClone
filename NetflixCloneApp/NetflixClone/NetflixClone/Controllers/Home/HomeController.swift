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
        let av = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        av.color = .white
        av.startAnimating()
        av.hidesWhenStopped = true
        return av
    }()
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = #colorLiteral(red: 0.103221871, green: 0.10324689, blue: 0.1032185927, alpha: 1)
        collectionView.register(HomeViewCell.self, forCellWithReuseIdentifier: cellId)
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
    
    override func viewDidAppear(_ animated: Bool) {
        HTTPCookieStorage.shared.cookies?.forEach({ (cookie) in
            print(cookie)
            if cookie.value == "" {
                print("no session")
                loginBtn.title = "Login"
            } else {
                loginBtn.title = "logout"
            }
        })
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
        cell.title.text = netflixOne.name
        cell.homeHorizontalController.netflix = netflixOne
        cell.homeHorizontalController.collectionView.reloadData()
        return cell
    }
}

// MARK: - Delegate Flow Layout

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 200)
    }
}

//MARK: - Fetching data from API
extension HomeController {
    func fetch() {
        
        let dispatchGroup = DispatchGroup()
        var group1 : Netflix?
        var group2 : Netflix?
        
        // Fetching Marval Universe
        dispatchGroup.enter()
        Service.shared.popular { (netflix, error) in
            print("Fetching Marval Universe...")
            dispatchGroup.leave()
            group1 = netflix
        }
        
        // Fetching DC Comics
        dispatchGroup.enter()
        Service.shared.fetchTopRated { (netflix, error) in
            print("Fetching DC Comics...")
            dispatchGroup.leave()
            group2 = netflix
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
            self.collectionView.reloadData()
        }
    }
}

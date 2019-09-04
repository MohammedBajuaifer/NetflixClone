//
//  HomeController.swift
//  NetflixClone
//
//  Created by Moe on 03/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit
import Alamofire


struct Netflix: Decodable {
    let createdAt: Int
    let movieName: String
}
class HomeController: MainListController {
    
    // MARK: - Properties
    
    fileprivate let cellId = "cellId"
    
    let loginBtn = UIBarButtonItem()
    
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
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
//        cell.backgroundColor = .red
//        cell
        return cell
    }
}

// MARK: - Delegate Flow Layout

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}

//
//  HomeController.swift
//  NetflixClone
//
//  Created by Moe on 03/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class HomeController: MainListController {
    
    // MARK: - Properties
    
    fileprivate let cellId = "cellId"
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.103221871, green: 0.10324689, blue: 0.1032185927, alpha: 1)
        collectionView.register(HomeViewCell.self, forCellWithReuseIdentifier: cellId)
        navigationItem.title = "NETFLIX"
//        navigationBar.tintColor = #colorLiteral(red: 0.8980392157, green: 0.03921568627, blue: 0.07450980392, alpha: 1)
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.8980392157, green: 0.03921568627, blue: 0.07450980392, alpha: 1), NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)]
        
    }
}

// MARK: - DataSource & Delegates

extension HomeController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
//        cell.backgroundColor = .red
        return cell
    }
}

// MARK: - Delegate Flow Layout

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
}

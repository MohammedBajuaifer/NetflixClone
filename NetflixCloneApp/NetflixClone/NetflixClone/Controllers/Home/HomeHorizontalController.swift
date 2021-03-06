//
//  HomeHorizontalController.swift
//  NetflixClone
//
//  Created by Moe on 03/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit
import Alamofire

class HomeHorizontalController: HorizontalCollectionViewController {
    
    // MARK: - Properties
    fileprivate let cellId = "tvHorizontalCellId"
    var netflix: Netflix?
    var didSelectHandler: ((Result) -> ())?
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .clear
        collectionView.register(HomeHorizontalCell.self, forCellWithReuseIdentifier: cellId)
    }
}

// MARK: - DataSource & Delegates
extension HomeHorizontalController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return netflix?.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeHorizontalCell
        let netflixItem = netflix?.results[indexPath.item]
        cell.label.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(netflixItem?.poster ?? "")"))
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let result = netflix?.results[indexPath.item] else { print("nono")
            return
        }
        didSelectHandler?(result)
    }
}

// MARK: - Delegate Flow Layout
extension HomeHorizontalController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 130, height: view.frame.height)
    }
}

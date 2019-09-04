//
//  HomeHorizontalController.swift
//  NetflixClone
//
//  Created by Moe on 03/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit
import Alamofire

class HomeHorizontalController: MainListController {
    
    // MARK: - Properties
    
    fileprivate let cellId = "cellId"
    var netflix = [Netflix]()
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .clear
        collectionView.register(HomeHorizontalCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.showsHorizontalScrollIndicator = false
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        fetch()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "hello", style: .plain, target: self, action: #selector(fetch))
    }
    
    @objc func fetch() {
        
        let url = "http://localhost:1337/home"
        
        Alamofire.request(url).validate(statusCode: 200..<300).responseData { (dataResp) in
            if let error = dataResp.error {
                print(error)
                return
            }
            let decoder = JSONDecoder()
            do {
                let netflix = try decoder.decode([Netflix].self, from: dataResp.data ?? Data())
                self.netflix = netflix
                self.collectionView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
            print("Worked")
        }
    }
}

// MARK: - DataSource & Delegates

extension HomeHorizontalController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return netflix.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeHorizontalCell
        cell.backgroundColor = .yellow
        let netflixItem = netflix[indexPath.item]
        cell.label.text = netflixItem.movieName
        return cell
    }
}

// MARK: - Delegate Flow Layout

extension HomeHorizontalController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 150, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 5, left: 5, bottom: 5, right: 5)
    }
}

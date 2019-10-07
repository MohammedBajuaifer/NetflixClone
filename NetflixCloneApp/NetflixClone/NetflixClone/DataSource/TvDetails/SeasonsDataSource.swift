//
//  SeasonsDataSource.swift
//  NetflixClone
//
//  Created by Moe on 23/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class SeasonsDataSource: NSObject, UICollectionViewDataSource {
    
    fileprivate let seasonCellId = "seasonCellId"
    var seasons = [Season]()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seasons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: seasonCellId, for: indexPath) as! HorizontalSeasonCell
        let season = seasons[indexPath.item]
        cell.seasonLabel.text = season.name
        return cell
    }
}

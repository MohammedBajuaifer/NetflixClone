//
//  Season.swift
//  NetflixClone
//
//  Created by Moe on 23/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import Foundation

struct Season: Decodable {
    
    let airDate: String?
    let episodeCount: Int?
    let id: Int
    let name: String
    let posterPath: String?
    let seasonNumber: Int?

    fileprivate enum CodingKeys: String, CodingKey {
        case name, id
        case airDate = "air_date"
        case posterPath = "poster_path"
        case episodeCount = "episode_count"
        case seasonNumber = "season_number"
    }
}


//
//  Episode.swift
//  NetflixClone
//
//  Created by Moe on 07/10/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import Foundation

struct Episode: Decodable {
    let id: Int?
    let episodes: [TvEpisodes]?
}

struct TvEpisodes: Decodable {
    let name: String
    let imagePath: String
    
    fileprivate enum CodingKeys: String, CodingKey {
        case name
        case imagePath = "still_path"
    }
}

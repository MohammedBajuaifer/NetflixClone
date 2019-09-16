//
//  SimilarTvShows.swift
//  NetflixClone
//
//  Created by Moe on 15/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import Foundation

struct SimilarTvShows: Decodable {
    let results: [SimilarTvShowsResults]
}

struct SimilarTvShowsResults: Decodable {
    let id: Int
    let poster, title, overview: String
    
    private enum CodingKeys: String, CodingKey {
        case id, title, overview
        case poster = "poster_path"
    }
}

//
//  Result.swift
//  NetflixClone
//
//  Created by Moe on 16/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import Foundation

struct Result: Decodable {
    let id: Int
    let poster: String?
    let title: String?
    let overview: String?
    let firstAirDate: String?
    let credits: Credit?
    let seasons: [Season]?
    let contentRatings: ContentRating?

    private enum CodingKeys: String, CodingKey {
        case title, overview, id, credits, seasons
        case firstAirDate = "first_air_date"
        case contentRatings = "content_ratings"
        case poster = "poster_path"
    }
}

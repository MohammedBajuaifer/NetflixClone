//
//  ContentRating.swift
//  NetflixClone
//
//  Created by Moe on 16/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import Foundation

struct ContentRating: Decodable {
    let results: [ContentRatingResults]
}

struct ContentRatingResults: Decodable {
    let rating: String
}

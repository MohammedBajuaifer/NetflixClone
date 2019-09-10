//
//  Netflix.swift
//  NetflixClone
//
//  Created by Moe on 10/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import Foundation

struct Netflix: Decodable {
    let name: String
    let results: [NetflixResults]
}

struct NetflixResults: Decodable {
    let poster_path: String
    let media_type: String
    let title: String
}

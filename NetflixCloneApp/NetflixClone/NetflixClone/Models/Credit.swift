//
//  Credit.swift
//  NetflixClone
//
//  Created by Moe on 15/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import Foundation

struct Credit: Decodable {
    let cast: [Cast]
    let crew: [Crew]
}

struct Cast: Decodable {
    let name: String
}

struct Crew: Decodable {
    let name: String
}

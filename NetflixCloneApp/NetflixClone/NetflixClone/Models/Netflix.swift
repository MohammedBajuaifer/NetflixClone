//
//  Netflix.swift
//  NetflixClone
//
//  Created by Moe on 10/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import Foundation

struct Netflix: Decodable {
    let name: String?
    let results: [Result]
}

struct Season: Decodable {}



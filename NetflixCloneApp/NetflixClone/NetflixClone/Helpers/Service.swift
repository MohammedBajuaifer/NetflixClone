//
//  Service.swift
//  NetflixClone
//
//  Created by Moe on 09/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class Service: NSObject {
    
    static let shared = Service()
    let apiKey = "345cdbdebf696cc58d4dd8ebbef4b1da"
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, error) in
            if let err = error {
                print("Failed to connect to server", err)
                completion(nil, error)
                return
            }
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let objects = try decoder.decode(T.self, from: data)
                completion(objects, nil)
                
            } catch {
                print("Failed to decode app group", error)
            }
        }.resume()
    }
    
    // Fetching Marvel Universe
    func fetchMarvelUniverse(completion: @escaping (Netflix?, Error?) -> ()) {
           let urlString = "https://api.themoviedb.org/4/list/1?page=1&api_key=\(apiKey)"
           fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // Fetching DC Comics
    func fetchComics(completion: @escaping (Netflix?, Error?) -> ()) {
        let urlString = "https://api.themoviedb.org/4/list/3?page=1&api_key=\(apiKey)"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
}

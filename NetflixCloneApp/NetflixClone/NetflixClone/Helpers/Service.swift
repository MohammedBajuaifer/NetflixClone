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
    
    // Fetching Top Rated
    func fetchTopRated(completion: @escaping (Netflix?, Error?) -> ()) {
            let urlString = "https://api.themoviedb.org/3/tv/top_rated?api_key=\(apiKey)&language=en-US&page=1"
           fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // Fetching OnTheAir
    func fetchOnTheAir(completion: @escaping (Netflix?, Error?) -> ()) {
        let urlString = "https://api.themoviedb.org/3/tv/on_the_air?api_key=\(apiKey)&language=en-US&page=2"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchAiringToday(completion: @escaping (Netflix?, Error?) -> ()) {
        let urlString = "https://api.themoviedb.org/3/tv/airing_today?api_key=\(apiKey)&language=en-US&page=2"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopTvShows(completion: @escaping (Netflix?, Error?) -> ()) {
        let urlString = "https://api.themoviedb.org/3/tv/top_rated?api_key=\(apiKey)&language=en-US&page=3"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchPopularTvShows(completion: @escaping (Netflix?, Error?) -> ()) {
        let urlString = "https://api.themoviedb.org/3/tv/popular?api_key=\(apiKey)&language=en-US&page=3"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func searchMedia(searchTerm: String, completion: @escaping (Netflix?, Error?) -> ()) {
        let urlString = "https://api.themoviedb.org/3/search/tv?api_key=\(apiKey)&language=en-US&query=\(searchTerm)&page=1&include_adult=false".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
      
        fetchGenericJSONData(urlString: urlString!, completion: completion)
    }
    
    func fetchMovieTvDetails(url: String, completion: @escaping (Result?, Error?) ->()) {
        fetchGenericJSONData(urlString: url, completion: completion)
    }
}

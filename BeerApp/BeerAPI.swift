//
//  BeerAPI.swift
//  BeerApp
//
//  Created by Tanishq Sharma on 2022-04-16.
//


import Foundation

final class BeerAPI {
    static let shared = BeerAPI();
    
    // apiURL
    let apiURL = "https://api.punkapi.com/v2/beers"
    
    private init(){}
    
    public func fetchCryptoData(
        completion: @escaping (Result<[BeerObject], Error>) -> Void
    ){
        guard let url = URL(string: apiURL) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            do {
                let tokens = try JSONDecoder().decode([BeerObject].self, from: data!)
                completion(.success(tokens))
            }
            
            catch {
                
            }
        }
        
        task.resume()
    }
}

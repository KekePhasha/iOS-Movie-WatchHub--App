//
//  MovieManagerAPI.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/26.
//

import Foundation

class MovieManagerAPI: ObservableObject {
    
    private var apiKey = "b382b782a8b5af28cca047715d980c31"
    @Published var trendingResults = [Results]()
    
    func fetchAllTrendingData() {
        
        if let url = URL(string: "https://api.themoviedb.org/3/trending/all/day?api_key=\(apiKey)") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeDate = data {
                        do {
                            let results = try decoder.decode(Trending.self, from: safeDate)
                            DispatchQueue.main.async {
                                self.trendingResults = results.results
                            }
                        } catch {
                            print(error)
                        }
                    }
                    
                } else{
                    print("Session Error")
                }
            }
            task.resume()
            
        }
    }
    
}

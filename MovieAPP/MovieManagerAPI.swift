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
    @Published var searchMovieID = SearchMovieID()
    @Published var searchTrailerMovieID = SearchTrailerMovieID()
    
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
    
    func fetchSeachMovieID(_ id: Int = 298618){
        if let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=\(apiKey)") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeDate = data {
                        do {
                            let results = try decoder.decode(SearchMovieID.self, from: safeDate)
                            DispatchQueue.main.async {
                                self.searchMovieID = results
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
        fetchVideoMovieKey(id)
    }
    
    func fetchVideoMovieKey(_ id: Int){
        
        if let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=\(apiKey)") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeDate = data {
                        do {
                            let results = try decoder.decode(SearchTrailerMovieID.self, from: safeDate)
                            DispatchQueue.main.async {
                                self.searchTrailerMovieID = results
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

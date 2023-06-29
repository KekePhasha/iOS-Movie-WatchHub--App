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
    @Published var trendingSeries = [Results]()
    @Published var popularMoviesResults = [Results]()
    @Published var popularSeriesResults = [Results]()
    @Published var mustSeeMovies = [Results]()
    @Published var mustSeeSeries = [Results]()
    @Published var searchMovieID = SearchMovieID()
    @Published var searchSeriesId = SearchSeriesId()
    @Published var searchTrailerMovieID = SearchTrailerMovieID()
    
    @Published var similarMovies = [Results]()
    @Published var similarSeries = [Results]()
    
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
        
        fetchAllPopularMovies("popular")
        
    }
    
    //MARK: - Trending Series
    func fetchTrendingSeries() {
        if let url = URL(string: "https://api.themoviedb.org/3/trending/tv/week?api_key=\(apiKey)") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeDate = data {
                        do {
                            let results = try decoder.decode(Trending.self, from: safeDate)
                            DispatchQueue.main.async {
                                self.trendingSeries = results.results
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
    
    //MARK: - Popular Movies
    func fetchAllPopularMovies(_ query: String) {
        
        if let url = URL(string: "https://api.themoviedb.org/3/movie/\(query)?api_key=\(apiKey)") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeDate = data {
                        do {
                            let results = try decoder.decode(Trending.self, from: safeDate)
                            DispatchQueue.main.async {
                                self.popularMoviesResults = results.results
                                
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
    
    func fetchMustSeeMovies() {
        
        if let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=\(apiKey)") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeDate = data {
                        do {
                            let results = try decoder.decode(Trending.self, from: safeDate)
                            DispatchQueue.main.async {
                                self.mustSeeMovies = results.results
                                
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
    
    
    func fetchAllPopularSeries() {
        
        if let url = URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=\(apiKey)") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeDate = data {
                        do {
                            let results = try decoder.decode(Trending.self, from: safeDate)
                            DispatchQueue.main.async {
                                self.popularSeriesResults = results.results
                                
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
    
    func fetchMustSeeSeries() {
        
        if let url = URL(string: "https://api.themoviedb.org/3/tv/top_rated?api_key=\(apiKey)") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeDate = data {
                        do {
                            let results = try decoder.decode(Trending.self, from: safeDate)
                            DispatchQueue.main.async {
                                self.mustSeeSeries = results.results
                                
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
    
    func fetchSeachSeriesId(_ id: Int = 114472){
        if let url = URL(string: "https://api.themoviedb.org/3/tv/\(id)?api_key=\(apiKey)") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeDate = data {
                        do {
                            let results = try decoder.decode(SearchSeriesId.self, from: safeDate)
                            DispatchQueue.main.async {
                                self.searchSeriesId = results
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
        fetchVideoMovieKey(id, type: "tv")
    }
    
    func fetchVideoMovieKey(_ id: Int, type: String = "movie"){
        
        if let url = URL(string: "https://api.themoviedb.org/3/\(type)/\(id)/videos?api_key=\(apiKey)") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeDate = data {
                        do {
                            let results = try decoder.decode(SearchTrailerMovieID.self, from: safeDate)
                            DispatchQueue.main.async {
                                self.searchTrailerMovieID = results
                                print(results)
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
    
    
    //MARK: - Simialr Movies
    
    func fetchSimialrMovies(_ id: Int) {
        
        if let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/recommendations?api_key=\(apiKey)") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeDate = data {
                        do {
                            let results = try decoder.decode(Trending.self, from: safeDate)
                            DispatchQueue.main.async {
                                self.similarMovies = results.results
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
    
    func fetchSimialrSeries(_ id: Int) {
        
        if let url = URL(string: "https://api.themoviedb.org/3/tv/\(id)/recommendations?api_key=\(apiKey)") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeDate = data {
                        do {
                            let results = try decoder.decode(Trending.self, from: safeDate)
                            DispatchQueue.main.async {
                                self.similarSeries = results.results
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

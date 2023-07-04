//
//  ListViewModel.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/07/03.
//

import Foundation

@MainActor
class ListViewModel: ObservableObject {
    @Published var results: [Results] = []
    @Published var seasonResults: [Episodes] = []
    
    func search( name: String, mediaType: String) async {
        do {
            let results = try await MovieManagerAPI().getMovies(searchTerm: name, mediaType: mediaType)
            self.results = results
        }
        catch {
            print(error)
        }
    }
    
    func season(seasonId: Int, seasonNum: Int) async {
        
        do {
            let results = try await MovieManagerAPI().getSeasons(seasonId: seasonId, seasonNum: seasonNum)
            self.seasonResults = results
        }catch {
            print (error)
        }
    }
}

//
//  MovieData.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/26.
//

import Foundation
import SwiftUI

struct Trending: Codable {
    var results: [Results]
}

struct Results: Codable, Identifiable {
    var id: Int = 385687
    var title: String? = "Title"
    var name: String? = "Name"
    var media_type: String? = "movie"
    var poster_path: String? = "/rktDFPbfHfUbArZ6OOOKsXcv0Bm.jpg"
    var vote_average: Double = 9.5
    //    var image: any View {
    //        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(poster_path)"), content: {
    //            image in
    //            image
    //                .renderingMode(.original)
    //                .resizable()
    //                .aspectRatio(contentMode: .fill)
    //                .frame(width: 141, height: 197)
    //                .cornerRadius(5)
    //
    //        }, placeholder: {
    //            ProgressView()
    //
    //        }
    //        )
    //    }
}

struct SearchMovieID: Codable {
    
    var overview: String = ""
    var release_date: String = ""
    var vote_average: Double = 0
    var genres: [Genre] = [Genre(id: 0, name: "")]
    var runtime: Double = 0
}

struct SearchSeriesId: Codable {
    var overview: String = ""
    var vote_average: Double = 0
    var genres: [Genre] = [Genre(id: 0, name: "")]
    var episode_run_time: [Int] = [10]
    var first_air_date: String = " "
    var number_of_seasons: Int? = 10
    
}

struct Genre: Codable, Identifiable {
    var id: Int = 0
    var name: String = ""
}

struct SearchTrailerMovieID: Codable {
    
    var results: [Trailers]? = [Trailers(key: "0", type: " ")]
}

struct Trailers: Codable {
    //    var id = UUID()
    var key: String = " "
    var type: String? = " "
    
    var hasTrailer: Bool {
        if type != nil {
            return true
        } else {
            return false
        }
    }
}

struct MovieSearch: Codable {
    var results: [Results]
}

struct SeriesSeasonSearch: Codable{
    var episodes: [Episodes]
    var _id: String
}


struct Episodes: Codable, Identifiable {
    var id: Int
    var episode_number: Int
    var name: String
    var overview: String
    var still_path: String
    var runtime: Int?
}


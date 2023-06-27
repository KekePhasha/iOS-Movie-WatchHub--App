//
//  MovieData.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/26.
//

import Foundation

struct Trending: Codable {
    var results: [Results]
}

struct Results: Codable, Identifiable{
    var id: Int = 9
    var title: String? = "Keke"
    var name: String? = "Keke"
    var media_type: String = "Movie"
    var poster_path: String = "rktDFPbfHfUbArZ6OOOKsXcv0Bm.jpg"
    var vote_average: Double = 9.5
}

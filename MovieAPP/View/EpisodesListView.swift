//
//  EpisodesListView.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/29.
//

import SwiftUI

struct EpisodesListView: View {
    
    @State var seasonNumber: Int = 1
    var body: some View {
        
        VStack(alignment: .leading){
            Menu("Season \(seasonNumber)" ) {
                Button("Season 1") {
                    print("name")
                    seasonNumber = 1
                }
                Button("Season 2") {
                    print("name")
                    seasonNumber = 2
                }
                Button("Season 3") {
                    print("name")
                    seasonNumber = 3
                }
            }
            
            EpisodeViewSingle()
        }
    }
}

struct EpisodesListView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesListView()
    }
}

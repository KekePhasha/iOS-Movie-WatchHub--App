//
//  EpisodesView.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/29.
//

import SwiftUI

struct EpisodeViewSingle: View {
    
    var episode: Episodes
    
    var body: some View {
        
        
        HStack(alignment: .top) {
//            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/dAyJqJ8KoglZysttC6BfVmDFQUt.jpg"), content: {
//                image in
//                image
////                    .renderingMode(.)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 141, height: 130)
//                    .cornerRadius(5)
//
//            }, placeholder: {
//                ProgressView()
//
//            }
//            )
            VStack(alignment: .leading) {
                Text("Episode: \(episode.episode_number)")
                    .font(.headline)
                Text(episode.name)
                    .font(.subheadline)
                    .padding(.bottom, 8)
                Text("Overview:")
                    .font(.headline)
                Text(episode.overview)
                HStack {
                    Text("Aired Date:")
                    Text("Mins")
                }
            }
            Spacer()
        }
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeViewSingle(episode: Episodes(id: 1, episode_number: 2, name: "Hello world", overview: "Welcome to Swift", still_path: "/kdfkdjf"))
    }
}

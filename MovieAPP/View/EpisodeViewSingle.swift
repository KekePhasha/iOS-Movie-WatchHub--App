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
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(episode.still_path)"), content: {
                image in
                image
//                    .renderingMode(.)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 141, height: 110)
                    .cornerRadius(5)

            }, placeholder: {
                ProgressView()

            }
            )
            VStack(alignment: .leading) {
                Text("\(episode.episode_number). \(episode.name)")
                    .font(.headline)
                    .padding(.bottom, 1)
                Text(episode.overview)
                    .frame(height: 80)
                    .truncationMode(.tail)
                if let runtime = episode.runtime {
                    Text("\(runtime) Mins")
                        .font(.caption)
                }
                Divider()
            }
            Spacer()
        }
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeViewSingle(episode: Episodes(id: 1, episode_number: 2, name: "Hello world", overview: "Welcome to Swift", still_path: "/rxWlBXZhGWhumbLB8gAHyyW3ITD.jpg", runtime: 22))
    }
}

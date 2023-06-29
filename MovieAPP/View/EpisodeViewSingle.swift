//
//  EpisodesView.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/29.
//

import SwiftUI

struct EpisodeViewSingle: View {
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/dAyJqJ8KoglZysttC6BfVmDFQUt.jpg"), content: {
                image in
                image
//                    .renderingMode(.)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 141, height: 130)
                    .cornerRadius(5)

            }, placeholder: {
                ProgressView()

            }
            )
            VStack(alignment: .leading) {
                Text("Episode: 8")
                    .font(.headline)
                Text("Episode Name")
                    .font(.subheadline)
                    .padding(.bottom, 8)
                Text("Overview:")
                HStack {
                    Text("Aired Date:")
                    Text("Mins")
                }
            }
        }
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeViewSingle()
    }
}

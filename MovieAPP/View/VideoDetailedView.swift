//
//  VideoDetailedView.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/26.
//

import SwiftUI

struct VideoDetailedView: View {
    var trend: Results = Results(id: 385687 ,title: "Through My Window: Across the Sea", poster_path: "dAyJqJ8KoglZysttC6BfVmDFQUt.jpg")
    
    @ObservedObject var searchMovieID = MovieManagerAPI()
    
    @State var isLikeSet: Bool = false
    @State var isWatchListSet: Bool = false
    
    var body: some View {
        ScrollView {
         
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(trend.poster_path)"), content: {
                    image in
                    image
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .cornerRadius(1)
                    
                }, placeholder: {
                  
                        ProgressView()
                                            
                }
                )
             
                    Text(trend.title ?? trend.name!)
                        .font(.title)
                        .padding(.horizontal, 15)
                        .bold()
//                        .padding(.bottom, 5)
                HStack {
                    Text(String (searchMovieID.searchMovieID.runtime/60))
                        .font(.subheadline)
                    Text(searchMovieID.searchMovieID.release_date)
                        .font(.subheadline)
                }
                .padding(.leading, 15)
                HStack(spacing: 15) {
                    Gauge(value:  searchMovieID.searchMovieID.vote_average == 0 ?
                        searchMovieID.searchSeriesId.vote_average
                          :
                        searchMovieID.searchMovieID.vote_average
                    , in: 0...10) {
                        Text("Ratings")
                    }
                    .gaugeStyle(.accessoryCircularCapacity)
                    .tint(.green)
                    
                   Spacer()
                    VStack {
                        Button {
                            isWatchListSet.toggle()
                            print(trend.media_type)
                            } label: {
                                Label("WishList", systemImage: isWatchListSet ? "checkmark" : "plus.square.on.square")
                                    .labelStyle(.iconOnly)
                                    .foregroundColor(isWatchListSet ? .green : .gray)
                                    .font(.system(size: 25))
                        }
                        Text("WatchList")
                            .font(.caption)
                    }
                    VStack {
                        Button {
                                isLikeSet.toggle()
                            } label: {
                                Label("Like", systemImage: isLikeSet ? "heart.fill" : "heart")
                                    .labelStyle(.iconOnly)
                                    .foregroundColor(isLikeSet ? .red : .gray)
                                    .font(.system(size: 28))
                        }
                        Text("Like")
                            .font(.caption)
                    }
                    
                }
                .padding(.horizontal, 15)
                
                
                GroupBox("Overview:") {
                    VStack(alignment: .leading) {
                        if trend.media_type == "movie"
                        {
                            Text(searchMovieID.searchMovieID.overview)
                        }
                        else {
                            Text(searchMovieID.searchSeriesId.overview)
                        }
                        
                        HStack {
                            if trend.media_type == "movie"
                            {
                                ForEach(searchMovieID.searchMovieID.genres) { genre in
                                    Text(genre.name)
                                        .font(.caption)
                                        .padding(5)
                                        .foregroundColor(.secondary)
                                        .background(.gray)
                                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 20)))
                                }
                            } else {
                                ForEach(searchMovieID.searchSeriesId.genres) { genre in
                                    Text(genre.name)
                                        .font(.caption)
                                        .padding(5)
                                        .foregroundColor(.secondary)
                                        .background(.gray)
                                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 20)))
                                }
                            }
                        }
                    }
                  
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                
                if (searchMovieID.searchTrailerMovieID.results?.first?.key != "0")  {
                    YouTubeVideoView(videoId:searchMovieID.searchTrailerMovieID.results?.last?.key)
                        .frame(height: UIScreen.main.bounds.size.height * 0.3)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)
                        .cornerRadius(5)
                        .aspectRatio(contentMode: .fill)
                } else {
                    Text("No trailer")
                }
                
                
                GroupBox("Simialr To:", content: {
                    ZStack(alignment: .leading) {
                        HStack {
                            Text("Keke")
                        }
                    }
                })
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                   
                
            }
           
        }
        .navigationTitle(trend.title ?? trend.name!)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            
            if trend.media_type == "movie" {
                searchMovieID.fetchSeachMovieID(trend.id)
            } else {
                print("tv")
                searchMovieID.fetchSeachSeriesId(trend.id)
                print(searchMovieID.searchTrailerMovieID.results?.last?.key ?? "No key")
            }
            
          
        }
        

    }
    
}

struct VideoDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailedView()
    }
}

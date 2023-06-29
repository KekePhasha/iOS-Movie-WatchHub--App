//
//  VideoDetailedView.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/26.
//

import SwiftUI

struct VideoDetailedView: View {
    var trend: Results = Results(id: 385687 ,title: "Fast X", poster_path: "fiVW06jE7z9YnO4trhaMEdclSiC.jpg")
    
    var type: String?

    
    @ObservedObject var searchMovieID = MovieManagerAPI()
    
    var formater = Formater()
    
    @State var isLikeSet: Bool = false
    @State var isWatchListSet: Bool = false
    @State var seasonNumber: Int = 1
    
    func mediaType(_ media: String? = " ")-> String{
    
        if  media == nil {
            return trend.media_type!
        } else {
            return media!
        }
            
    }
    
    var body: some View {
        ScrollView {
         
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(trend.poster_path)"), content: {
                    image in
                    image
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
                    
                    if mediaType(type) == "movie" {
                        Text(String (formater.formatRuntime( searchMovieID.searchMovieID.runtime/60)))
                            .font(.subheadline)
                        Text(formater.formatYear(searchMovieID.searchMovieID.release_date))
                            .font(.subheadline)
                    } else {
                        Text(String ("Testing"))
                            .font(.subheadline)
                        Text("Testing")
                            .font(.subheadline)
                    }
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
                        if mediaType(type) == "movie"
                        {
                            Text(searchMovieID.searchMovieID.overview)
                        }
                        else {
                            Text(searchMovieID.searchSeriesId.overview)
                        }
                        
                        HStack {
                            if mediaType(type) == "movie"
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
                
                
                if mediaType(type) == "movie"{
                    GroupBox("Episodes:") {
                        VStack(alignment: .leading) {
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
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                }
                
                
                
                GroupBox("Simialr To:", content: {
                    ZStack(alignment: .leading) {
                        HStack {
                            if mediaType(type) == "movie"
                            {
                                TrendingRow(trends: searchMovieID.similarMovies, type: "movie")
                            } else {
                                
                                TrendingRow(trends: searchMovieID.similarSeries, type: "tv")
                            }
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
            
            if mediaType(type) == "movie" {
                
                searchMovieID.fetchSeachMovieID(trend.id)
                searchMovieID.fetchSimialrMovies(trend.id)
                
            } else {
                print("Key: \(trend.id) ")
                
                searchMovieID.fetchSeachSeriesId(trend.id)
                searchMovieID.fetchSimialrSeries(trend.id)
               
            }
          
        }
    
        

    }
    
}

struct VideoDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailedView()
    }
}

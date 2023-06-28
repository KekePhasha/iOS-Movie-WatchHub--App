//
//  SeriesScreen.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/28.
//

import SwiftUI

struct SeriesScreen: View {
    
    @ObservedObject var movieManagerAPI = MovieManagerAPI()
   
    var body: some View {
        NavigationView {
           
            ScrollView {
              
                GroupBox {
                    VStack(alignment: .leading) {
                        HStack {
                            Label("Coming Soon", systemImage: "star.circle")
                                .font(.headline)
                                .foregroundColor(.yellow)
                                .labelStyle(.iconOnly)
                            Text("Trending")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                       
                        TrendingRow(trends: movieManagerAPI.trendingSeries)
                        
                    }
                    .padding(.vertical, 2)
                }
                .padding(.bottom, 10)
                    
                GroupBox {
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Label("Must See", systemImage: "exclamationmark.triangle.fill")
                                .font(.headline)
                                .foregroundColor(.orange)
                                .labelStyle(.iconOnly)
                            Text("Must See")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                       
                        TrendingRow(trends: movieManagerAPI.mustSeeSeries, type: "tv")
                    }
                }
                .padding(.bottom, 10)
              
                GroupBox {
                    VStack(alignment: .leading) {
                        HStack {
                            Label("Popular Series", systemImage: "flame.fill")
                                .font(.headline)
                                .foregroundColor(.red)
                                .labelStyle(.iconOnly)
                            Text("Popular Series")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        TrendingRow(trends: movieManagerAPI.popularSeriesResults, type: "tv")
                        
                    
                        
                    }
                }
                .padding(.bottom, 10)
            }
            .padding()
            .navigationTitle("Series")
            .onAppear {
            
                movieManagerAPI.fetchAllPopularSeries()
                movieManagerAPI.fetchMustSeeSeries()
                movieManagerAPI.fetchTrendingSeries()
              
            }
            
            .toolbar {
                Button {
                    
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }

            }
            
        }
//        .onAppear {
//            UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Monoton-Regular", size: 40)!]
//        }
        
    }
}

struct SeriesScreen_Previews: PreviewProvider {
    static var previews: some View {
        SeriesScreen()
    }
}

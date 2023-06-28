//
//  ContentView.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/26.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var movieManagerAPI = MovieManagerAPI()
    
    var body: some View {
        NavigationView {
           
            ScrollView {
                GroupBox {
                    VStack(alignment: .leading) {
                        HStack {
                            Label("Trending", systemImage: "bolt")
                                .font(.headline)
                                .foregroundColor(.yellow)
                                .labelStyle(.iconOnly)
                            Text("Trending")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                       
                        TrendingRow(trends: movieManagerAPI.trendingResults)
                        
                    }
                    .padding(.vertical, 2)
                }
                .padding(.bottom, 10)
                    
                GroupBox {
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Label("Popular Movies", systemImage: "flame.fill")
                                .font(.headline)
                                .foregroundColor(.red)
                                .labelStyle(.iconOnly)
                            Text("Popular Movies")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                       
                        TrendingRow(trends: movieManagerAPI.popularMoviesResults)
                    }
                }
                .padding(.bottom, 10)
              
                GroupBox {
                    VStack(alignment: .leading) {
                        HStack {
                            Label("Popular Movies", systemImage: "flame.fill")
                                .font(.headline)
                                .foregroundColor(.red)
                                .labelStyle(.iconOnly)
                            Text("Popular Series")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                    
                        
                    }
                }
                .padding(.bottom, 10)
            }
            .padding()
            .navigationTitle("Home")
            .onAppear {
                movieManagerAPI.fetchAllTrendingData()
              
            }
            
        }
//        .onAppear {
//            UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Monoton-Regular", size: 40)!]
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

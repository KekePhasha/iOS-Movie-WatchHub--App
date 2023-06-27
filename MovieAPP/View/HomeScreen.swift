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
           
            List {
    
                TrendingRow(trends: movieManagerAPI.trendingResults)
               
                Label("Popular Movies", systemImage: "flame.fill")
                    .foregroundColor(.red)
                    
            }
         
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

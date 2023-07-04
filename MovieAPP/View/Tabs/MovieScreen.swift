//
//  MovieScreen.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/28.
//

import SwiftUI

struct MovieScreen: View {
    
    @ObservedObject var movieManagerAPI = MovieManagerAPI()
    @State var showingProfile = false
    
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
                            Text("Coming Soon")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                       
                        TrendingRow(trends: movieManagerAPI.popularMoviesResults, type: "movie")
                        
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
                        
                       
                        TrendingRow(trends: movieManagerAPI.popularMoviesResults, type: "movie")
                    }
                }
                .padding(.bottom, 10)
              
                GroupBox {
                    VStack(alignment: .leading) {
                        HStack {
                            Label("Popular Movies", systemImage: "exclamationmark.triangle.fill")
                                .font(.headline)
                                .foregroundColor(.orange)
                                .labelStyle(.iconOnly)
                            Text("Must see")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        TrendingRow(trends: movieManagerAPI.mustSeeMovies, type: "movie")
                        
                    
                        
                    }
                }
                .padding(.bottom, 10)
            }
            .padding()
            .navigationTitle("Movies")
            .onAppear {
                movieManagerAPI.fetchAllPopularMovies("upcoming")
                movieManagerAPI.fetchMustSeeMovies()
              
            }
            
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }

            }
            
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    
            }
            
        }
    }
}

struct MovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieScreen()
    }
}

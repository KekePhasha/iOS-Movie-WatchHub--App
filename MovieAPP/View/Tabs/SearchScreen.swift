//
//  SearchScreen.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/28.
//

import SwiftUI

struct SearchScreen: View {
//    @ObservedObject var movieManagerAPI = MovieManagerAPI()
    
    @State private var searchText = " "
    @State private var selection = "movie"
    private var mediaType = ["movie", "tv"]
    
    @StateObject private var listVM = ListViewModel ()
    
    var body: some View {
        NavigationView {
            
            VStack {
                Picker("Type", selection: $selection)  {
                    ForEach(mediaType, id: \.self) {
                        Text($0)
                    }
                    
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                List(listVM.results) { item in
                    NavigationLink(destination: VideoDetailedView(trend: item, type: selection)) {
                        HStack(alignment: .top) {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(item.poster_path)"), content: {
                                image in
                                image
                //                    .renderingMode(.)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxHeight: 110)
                                    .cornerRadius(5)

                            }, placeholder: {
                                ProgressView()

                            }
                            )
                            Text((item.title ?? item.name) ?? "Nothing")
                        }
                    }
                    
                }
                //            .listStyle(.plain)
                .searchable(text: $searchText)
                .onChange(of: searchText, perform: { value in
                    // aysnc
                    
                    Task {
                        if !value.isEmpty && value.count > 3{
                            // call search function  await
                            await listVM.search(name: value, mediaType: selection)
                           
                        } else
                        {
                            listVM.results.removeAll()
                        }
                    }
                })
                .navigationTitle("Search")
            }
        }
        
        
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}

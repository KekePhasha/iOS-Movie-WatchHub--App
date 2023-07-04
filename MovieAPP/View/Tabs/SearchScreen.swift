//
//  SearchScreen.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/28.
//

import SwiftUI
import Combine

private class DebouncedState<Value>: ObservableObject {
    @Published var currentValue: Value
    @Published var debouncedValue: Value
    
    init(initialValue: Value, delay: Double = 0.5){
        _currentValue = Published(initialValue: initialValue)
        _debouncedValue = Published(initialValue: initialValue)
        
        $currentValue
            .debounce(for: .seconds(delay), scheduler: RunLoop.main)
            .assign(to: &$debouncedValue)
    }
}

struct SearchScreen: View {
//    @ObservedObject var movieManagerAPI = MovieManagerAPI()
    
    @StateObject private var searchText = DebouncedState(initialValue: " ")
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
                            if let url = item.poster_path  {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(url)"), content: {
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
                            } else {
                                Text("No Image")
                            }
                            Text((item.title ?? item.name) ?? "Nothing")
                        }
                    }
                    
                }
                //            .listStyle(.plain)
                .searchable(text: $searchText.currentValue)
               
                .onChange(of: searchText.debouncedValue, perform: { value in
                    Task {
                        if !value.isEmpty && value.count > 1 {
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

//
//  MovieAPPApp.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/26.
//

import SwiftUI

@main
struct MovieAPPApp: App {
    @State private var selection = "Home"
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selection) {
                HomeScreen()
                    .tabItem {
                    Label("Home", systemImage: "house")
                }
                    .tag(selection)
                MovieScreen()
                    .tabItem {
                        Label("Movies", systemImage: "play.rectangle")
                        
                    }
                    .tag(selection)
                SeriesScreen()
                    .tabItem {
                        Label("Series", systemImage: "square.stack")
                        
                    }
                    .tag(selection)
                SearchScreen()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                        
                    }
                    .tag(selection)
            }
           
            
        }
    }
}

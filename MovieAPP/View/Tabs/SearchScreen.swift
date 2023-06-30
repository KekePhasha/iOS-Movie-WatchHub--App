//
//  SearchScreen.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/28.
//

import SwiftUI

struct SearchScreen: View {
    @State var selection = " "
    
    var body: some View {
        NavigationView {
            List {
               
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $selection, prompt: Text("Search..."))
                        .textFieldStyle(.roundedBorder)
                }
                    
                Picker("Type", selection: $selection)  {
                    Text("Movie")
                    Text("Series")
                   
                }
                .pickerStyle(.segmented)
                
                Picker("Genre", selection: $selection)  {
                    Text("Action")
                    Text("Comdey")
                   
                }
                .pickerStyle(.inline)
                
                
            }
            .navigationTitle("Search")
        }
        
      
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}

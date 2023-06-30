//
//  ProfileHost.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/28.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode
    @State private var users = ["Attack On Titains", "Black Mirror", "Fast X", "Demon Slayer"]
    @State private var selection = "Movie"
    
    var body: some View {
        VStack {
            HStack{
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel){
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary()
                Divider()
                    .padding(.bottom)
                Text("WatchList")
                    .font(.headline)
                    .padding(.bottom, 5)
               
                Picker("Type", selection: $selection)  {
                    Text("Movie")
                    Text("Series")
                   
                }
                .pickerStyle(.segmented)
                HStack {
                    Image(systemName: "info.circle")
                    Text("Swipe left to delete video from watchlist")
                        .font(.caption)
                }
                List( $users, id: \.self, editActions: .delete) { $user in
                    
                        Text(user)
                    }
//                    .listStyle(.inset)
            
            } else
            {
                ProfileEdit()
            }
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}

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
    
    var body: some View {
        VStack( spacing: 20) {
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
                Text("WatchList")
                    .font(.headline)
            
                List( $users, id: \.self, editActions: .delete) { $user in
                    
                        Text(user)
                    }
//                    .listStyle(.inset)
            
            } else
            {
                ProfileSummary()
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

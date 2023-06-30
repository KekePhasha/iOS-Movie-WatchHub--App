//
//  ProfileEdit.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/30.
//

import SwiftUI

struct ProfileEdit: View {
    
    @State private var username = "Keke Phasha"
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing) {
                
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 100))
//                        .overlay {
//                          Gradient(colors: [Color])
//                        }
                Button {
                    
                } label: {
                    Label("Edit", systemImage: "camera")
                        .foregroundColor(.red)
                        .font(.system(size: 35))

                        .labelStyle(.iconOnly)
                }
              
            }
            List {
                HStack {
                    Text("Email:")
                        .bold()
                        Divider()
                    Text("kekephasha@gmail.com")
                        
                }
                HStack {
                    Text("Username:")
                        .bold()
                        Divider()
                    TextField("Username", text: $username, prompt: Text(username))
                        .textFieldStyle(.roundedBorder)
                }
            }
            Button {
                print("Delete")
            } label: {
                Text("Delete Account")
                    .foregroundColor(.red)
            }
            

                
        
            Spacer()
        }
    }
}

struct ProfileEdit_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEdit()
    }
}

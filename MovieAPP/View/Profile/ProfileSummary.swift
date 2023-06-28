//
//  ProfileSummary.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/28.
//

import SwiftUI

struct ProfileSummary: View {
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
                
            Text("Keke Phasha")
                .bold()
                .font(.title)
//            Spacer()
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary()
    }
}

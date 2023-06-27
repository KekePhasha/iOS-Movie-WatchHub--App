//
//  VideoDetailedView.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/26.
//

import SwiftUI

struct VideoDetailedView: View {
    var trend: Results = Results(title: "Through My Window: Across the Sea", poster_path: "dAyJqJ8KoglZysttC6BfVmDFQUt.jpg")
    
    @State var isSet: Bool = false
    
    var body: some View {
        ScrollView {
         
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(trend.poster_path)"), content: {
                    image in
                    image
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .cornerRadius(1)
                    
                }, placeholder: {
                  
                        ProgressView()
                                            
                }
                )
             
                    Text(trend.title ?? trend.name!)
                        .font(.title)
                        .padding(.leading, 15)
                        .bold()
                        .padding(.bottom, 5)
                HStack(spacing: 15) {
                   Spacer()
                    VStack {
                        Button {
                                isSet.toggle()
                            } label: {
                                Label("WishList", systemImage: isSet ? "checkmark" : "plus.square.on.square")
                                    .labelStyle(.iconOnly)
                                    .foregroundColor(isSet ? .green : .gray)
                                    .font(.system(size: 25))
                        }
                        Text("WatchList")
                            .font(.caption)
                    }
                    VStack {
                        Button {
                                isSet.toggle()
                            } label: {
                                Label("Like", systemImage: isSet ? "heart.fill" : "heart")
                                    .labelStyle(.iconOnly)
                                    .foregroundColor(isSet ? .red : .gray)
                                    .font(.system(size: 28))
                        }
                        Text("Like")
                            .font(.caption)
                    }
                    
                    
                }
                .padding(.trailing, 15)
                
                
            }
           
        }
        .navigationTitle(trend.title ?? trend.name!)
        .navigationBarTitleDisplayMode(.inline)

    }
    
}

struct VideoDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailedView()
    }
}

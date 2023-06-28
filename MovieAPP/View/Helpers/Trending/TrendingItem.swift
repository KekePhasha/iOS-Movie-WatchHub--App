//
//  TrendingItem.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/26.
//

import SwiftUI

struct TrendingItem: View {
    
    var trend: Results = Results(title: "Through My Window: Across the Sea", poster_path: "dAyJqJ8KoglZysttC6BfVmDFQUt.jpg")
    
  
    var body: some View {
        
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(trend.poster_path)"), content: {
                image in
                image
//                    .renderingMode(.)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 141, height: 197)
                    .cornerRadius(5)

            }, placeholder: {
                ProgressView()

            }
            )
                       
//                Text(trend.title ?? trend.name!)
//                    .font(.subheadline)
//                    .foregroundColor(.primary)
//                .frame(width: 140)
                       
        }
        .padding(.leading, 15)
    }
}

struct TrendingItem_Previews: PreviewProvider {
    static var previews: some View {
        TrendingItem()
    }
}

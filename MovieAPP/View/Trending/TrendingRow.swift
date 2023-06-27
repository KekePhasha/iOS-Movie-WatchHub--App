//
//  TrendingRow.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/26.
//

import SwiftUI

struct TrendingRow: View {
    
    var trends: [Results] = [Results(id: 1, title: "Through My Window: Across the Sea", poster_path: "dAyJqJ8KoglZysttC6BfVmDFQUt.jpg"), Results(id: 5, title: "Extraction 2", poster_path: "7gKI9hpEMcZUQpNgKrkDzJpbnNS.jpg")]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Label("Trending", systemImage: "bolt")
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.leading, 15)
                .padding(.top, 5)
                .padding(.bottom)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top , spacing: 0) {
                    ForEach(trends) { trend in
                        
                        NavigationLink(destination: VideoDetailedView(trend: trend)) {
                            TrendingItem(trend: trend)
                        }
                    }
                    
                }
            }
         
            
        }
       
        
    }
}

struct TrendingRow_Previews: PreviewProvider {
    static var previews: some View {
        TrendingRow()
    }
}


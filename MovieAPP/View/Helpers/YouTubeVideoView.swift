//
//  YouTubeVideoView.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/27.
//

import Foundation
import WebKit
import SwiftUI


struct YouTubeVideoView: UIViewRepresentable {
    
    let videoId: String?
    
    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let safeVideoId = videoId {
            if let url = URL(string: "https://www.youtube.com/embed/\(safeVideoId)") {
                uiView.scrollView.isScrollEnabled = false
                let request = URLRequest(url: url)
                DispatchQueue.main.async {
                    uiView.load(request)
                }
               
            }
        } else
        {
            return
        }
    }
}


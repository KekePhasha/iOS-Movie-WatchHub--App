//
//  Formater.swift
//  MovieAPP
//
//  Created by Kekeletso Phasha on 2023/06/29.
//

import Foundation

class Formater {
    
    func formatYear(_ dateString: String) -> String {
      
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yy-mm-dd"

        guard let dateFormated = dateFormatter.date(from: dateString) else { return "Empty Date " }

        dateFormatter.dateFormat = "yyyy"

        return dateFormatter.string(from: dateFormated)
    }
    
    func formatRuntime(_ runtimeString: Double) -> String {
    let integer = Int(runtimeString)
    let decimal = Int(runtimeString.truncatingRemainder(dividingBy: 1) * 100)
        
      return "\(integer)h \(decimal)min"
    }
    

}

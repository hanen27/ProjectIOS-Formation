//
//  ImageDownloader.swift
//  ExerciceMeteo
//
//  Created by Hanen Abdelkrim on 14/11/2022.
//

import Foundation

class ImageDownloader {
    let base = "https://openweathermap.org/img/wn/"
    let end = "@2x.png"
    
    
    func imageURL(_ code: String)->URL?{
        return URL(string: base + code + end)
    }
    func download(_ code: String, completion: ((Data?) -> Void)?) {
        if let url = imageURL(code) {
            URLSession.shared.dataTask(with: url) { d, _, _ in
                completion?(d)
            }.resume()
            
        }else {
            completion?(nil)
        }
    }
}

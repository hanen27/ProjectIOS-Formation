//
//  ApiHelpers.swift
//  ExerciceMeteo
//
//  Created by Hanen Abdelkrim on 11/11/2022.
//

import Foundation
class ApiHelpers {
   static let shared = ApiHelpers()
    private let _apiKey = "a79e37171df2e36d266c4c417f3c9bae"
    let base = "https://api.openweathermap.org/data/2.5/forecast"
    var appId: String {
        return "&appid=" + _apiKey
    }
    let units = "&units=metric"
    let lang = "&lang=fr"
    func getUrl(coords: String) -> URL? {
        var urlString = base
        urlString += coords
        urlString += lang
        urlString += units
        urlString += appId
        print("hahahhaha",urlString)
        return URL(string: urlString)
    
}
    func parseWeather(coords: String, completion: (([Forecast])-> Void)?) {
        if let url = getUrl(coords: coords) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let d = data {
                    do {
                        let decoder = try JSONDecoder().decode(ApiResult.self, from: d)
                        completion?(decoder.list)
                    }catch {
                        print(error.localizedDescription)
                        
                    }
                }else {

                }
                
            }.resume()
        
    }
    else {
        completion?([])

    }
    
}
}

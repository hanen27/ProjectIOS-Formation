//
//  ApiResult.swift
//  ExerciceMeteo
//
//  Created by Hanen Abdelkrim on 11/11/2022.
//

import Foundation
struct ApiResult: Decodable {
    var list : [Forecast]
    
}
struct Forecast: Decodable {
    var dt: Int
    var main: Main
    var weather: [Weather]
    var dt_txt: String
    
}
struct Main: Decodable{
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    
}
struct Weather: Decodable{
    var id: Int
    var main: String
    var description: String
    var icon: String
    
}



//{"cod":"200","message":0,"cnt":40,"list":[{"dt":1668189600,"main":{"temp":287.6,"feels_like":287.24,"temp_min":285.79,"temp_max":287.6,"pressure":1026,"sea_level":1026,"grnd_level":1023,"humidity":82,"temp_kf":1.81},"weather":[{"id":803,"main":"Clouds","description":"nuageux","icon":"04n"}],"clouds":{"all":70},"wind":{"speed":3.39,"deg":193,"gust":8.93},"visibility":10000,"pop":0,"sys":{"pod":"n"},"dt_txt":"2022-11-11 18:00:00"},{"dt":1668200400,"main":{"temp":285.77,"feels_like":285.25,"temp_min":284.41,"temp_max":285.77,"pressure":1027,"sea_level":1027,"grnd_level":1025,"humidity":83,"temp_kf":1.36},"weather":[{"id":802,"main":"Clouds","description":"partiellement nuageux","icon":"03n"}],"clouds":{"all":30},"wind":{"speed":1.68,"deg":170,"gust":5.71},"visibility":10000,"pop":0,"sys":{"pod":"n"},"dt_txt":"2022-11-11 21:00:00"},{"dt":1668211200,"main":{"temp":283.77,"feels_like":283,"temp_min":283.77,"temp_max":283.77,"pressure":1028,"sea_level":1028,"grnd_level":1024,"humidity":81,"temp_kf":0},"weather":[{"id":803,"main":"Clouds","description":"nuageux","icon":"04n"}],"clouds":{"all":53},"wind":{"speed":1.5,"deg":158,"gust":2.63},"visibility":10000,"pop":0,"sys":{"pod":"n"},"dt_txt":"2022-11-12 00:00:00"},{"dt":1668222000,"main":{"temp":283.69,"feels_like":282.94,"temp_min":283.69,"temp_max":283.69,"pressure":1027,"sea_level":1027,"grnd_level":1024,"humidity":82,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"couvert","icon":"04n"}],"clouds":{"all":100},"wind":{"speed":1.67,"deg":142,"gust":3.24},"visibility":10000,"pop":0,"sys":{"pod":"n"},"dt_txt":"2022-11-12 03:00:00"}

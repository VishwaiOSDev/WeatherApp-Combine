//
//  Weather.swift
//  Combine Weather
//
//  Created by Vishweshwaran on 27/10/20.
//

import Foundation

struct WeatherResponse : Decodable {
    var main : Weather
}

struct Weather : Decodable {
    
    var temp : Double?
    var humidity : Double?
    
    static var placeholder : Weather{
        return Weather(temp: nil, humidity: nil)
    }
    
}


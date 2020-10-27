//
//  Constants.swift
//  Combine Weather
//
//  Created by Vishweshwaran on 27/10/20.
//

import Foundation


struct Constants {
    
    struct URLs {
        
        static func weather(city : String) -> String {
            return "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=77d901b1230d8d2578659c190aa1f011&units=imperial"
        }
        
    }
    
}


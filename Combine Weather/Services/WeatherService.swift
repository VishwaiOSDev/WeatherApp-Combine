//
//  WeatherService.swift
//  Combine Weather
//
//  Created by Vishweshwaran on 27/10/20.
//

import Foundation
import Combine


struct WebService {
    
    func fetchWeather(city : String) -> AnyPublisher<Weather , Error>{
        
        guard let url = URL(string: Constants.URLs.weather(city: city)) else { fatalError("Invaild URL") }
        
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data}
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .map{$0.main}
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}

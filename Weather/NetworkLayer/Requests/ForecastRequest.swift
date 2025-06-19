//
//  ForecastRequest.swift
//  Weather
//
//  Created by Дарья Шишмакова on 19.06.2025.
//

import Foundation

struct ForecastRequest: NetworkRequest {
    var endpoint: URL? {
        URL(string: "https://api.weatherapi.com/v1/forecast.json?q=\(city)&days=5&key=59caef7dd0d84cad986122644251906")
    }
    
    var city: String
    
    init(for city: String) {
        self.city = city
    }
}

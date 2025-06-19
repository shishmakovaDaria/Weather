//
//  ForecastRequest.swift
//  Weather
//
//  Created by Дарья Шишмакова on 19.06.2025.
//

import Foundation

struct ForecastRequest: NetworkRequest {
    let endpoint: URL?
    
    init(for city: String) {
        var components = URLComponents(string: "https://api.weatherapi.com/v1/forecast.json")
        components?.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "days", value: "5"),
            URLQueryItem(name: "key", value: Constants.apiKey)
        ]
        self.endpoint = components?.url
    }
}

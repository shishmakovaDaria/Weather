//
//  Forecast.swift
//  Weather
//
//  Created by Дарья Шишмакова on 19.06.2025.
//

import Foundation

struct WeatherResponse: Codable {
    let forecast: ForecastResponse
}

struct ForecastResponse: Codable {
    let forecastday: [forecastDay]
}

struct forecastDay: Codable {
    let date: String
}

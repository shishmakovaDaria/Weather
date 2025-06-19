//
//  Forecast.swift
//  Weather
//
//  Created by Дарья Шишмакова on 19.06.2025.
//

import Foundation

struct WeatherResponse: Codable {
    let location: Location
    let forecast: ForecastResponse
}

struct Location: Codable {
    let name: String
    let country: String
}

struct ForecastResponse: Codable {
    let forecastday: [ForecastDay]
}

struct ForecastDay: Codable {
    let date: String
    let day: Day
}

struct Day: Codable {
    let avgtempC: Double
    let maxwindKph: Double
    let avghumidity: Int
    let condition: Condition
}

struct Condition: Codable {
    let text: String
    let icon: String
}

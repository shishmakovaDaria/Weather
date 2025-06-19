//
//  DayWeatherModel.swift
//  Weather
//
//  Created by Дарья Шишмакова on 19.06.2025.
//

import Foundation

struct DayWeatherModel: Identifiable, Hashable {
    let id = UUID()
    let date: Date
    let temperature: Double
    let windSpeed: Double
    let humidity: Int
    let condition: String
    let iconPath: String
    
    init(from forecastDay: ForecastDay) {
        self.date = forecastDay.date.toDate() ?? Date()
        self.temperature = forecastDay.day.avgtempC
        self.windSpeed = forecastDay.day.maxwindKph
        self.humidity = forecastDay.day.avghumidity
        self.condition = forecastDay.day.condition.text
        self.iconPath = forecastDay.day.condition.icon
    }
}

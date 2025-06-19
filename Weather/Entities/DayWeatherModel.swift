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
    let temperature: Int
    let windSpeed: Double
    let humidity: Int
    let condition: String
    let iconPath: String
    
    init(from forecastDay: ForecastDay) {
        self.date = forecastDay.date.toDate() ?? Date()
        self.temperature = Int(forecastDay.day.avgtempC.rounded())
        self.windSpeed = forecastDay.day.maxwindKph
        self.humidity = forecastDay.day.avghumidity
        self.condition = forecastDay.day.condition.text
        self.iconPath = forecastDay.day.condition.icon
    }
    
    init(date: Date, temperature: Int, windSpeed: Double, humidity: Int, condition: String, iconPath: String) {
        self.date = date
        self.temperature = temperature
        self.windSpeed = windSpeed
        self.humidity = humidity
        self.condition = condition
        self.iconPath = iconPath
    }
    
    var dayOfWeek: String {
        if Calendar.current.isDateInToday(date) {
            return "Today"
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE"
            return formatter.string(from: date)
        }
    }

    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        return formatter.string(from: date)
    }
    
    var iconURL: URL? {
        URL(string: "https:" + iconPath)
    }
}

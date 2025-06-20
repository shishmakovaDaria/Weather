//
//  WeatherView.swift
//  Weather
//
//  Created by Дарья Шишмакова on 20.06.2025.
//

import SwiftUI

struct WeatherView: View {
    let isLoading: Bool
    let dayWeather: [DayWeatherModel]
    let weatherLocation: Location
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.blue.opacity(0.8),
                    Color.orange.opacity(0.8)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            VStack {
                if isLoading {
                    Spacer()
                    ProgressView()
                        .progressViewStyle(.circular)
                        .scaleEffect(2.0)
                } else if !dayWeather.isEmpty {
                    HStack(spacing: 10) {
                        Image(systemName: "location.fill")
                        Text("\(weatherLocation.name), \(weatherLocation.country)")
                            .font(.headline)
                    }
                    .padding(.top, 16)
                    ScrollView (showsIndicators: false) {
                        LazyVStack {
                            ForEach(dayWeather) { dayWeather in
                                WeatherRowView(dayWeather: dayWeather)
                            }
                        }
                        .padding(.top, 16)
                    }
                    .padding([.leading, .trailing], 16)
                }
                Spacer()
                Divider()
                Link(LocalizableStrings.accordingToLink,
                     destination: URL(string: "https://www.weatherapi.com/")!)
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.top, 5)
            }
        }
    }
}

#Preview("main") {
    WeatherView(
        isLoading: false,
        dayWeather: [
            DayWeatherModel(
                date: Date(),
                temperature: 13,
                windSpeed: 16.2,
                humidity: 94,
                condition: "Moderate rain",
                iconPath: ""
            ),
            DayWeatherModel(
                date: Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date(),
                temperature: 16,
                windSpeed: 18.2,
                humidity: 87,
                condition: "Sunny",
                iconPath: ""
            )
        ],
        weatherLocation: Location(name: "Moscow", country: "Russia")
    )
}

#Preview("loading") {
    WeatherView(
        isLoading: true,
        dayWeather: [],
        weatherLocation: Location(name: "", country: "")
    )
}

//
//  MainRowView.swift
//  Weather
//
//  Created by Дарья Шишмакова on 19.06.2025.
//

import SwiftUI

struct WeatherRowView: View {
    let dayWeather: DayWeatherModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("\(dayWeather.dayOfWeek), \(dayWeather.formattedDate)")
                    .font(.title2)
                HStack {
                    AsyncImage(url: dayWeather.iconURL) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .frame(width: 40, height: 40)
                        } else {
                            Image(systemName: "sun.max.fill")
                        }
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(dayWeather.temperature)°")
                        Text(dayWeather.condition)
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 5) {
                        HStack {
                            Image(systemName: "wind")
                            Text(String(format: "%.1f", dayWeather.windSpeed) + " km/h")
                        }
                        HStack {
                            Image(systemName: "drop.fill")
                            Text("\(dayWeather.humidity)%")
                        }
                    }
                    .padding(.trailing, 16)
                }
            }
            .padding([.leading, .top, .bottom], 16)
            Spacer()
        }
        .background(.white.opacity(0.6))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    ZStack {
        Color.gray
            .ignoresSafeArea()
        WeatherRowView(
            dayWeather: DayWeatherModel(
                date: Date(),
                temperature: 13,
                windSpeed: 16.2,
                humidity: 94,
                condition: "Moderate rain",
                iconPath: ""
            )
        )
    }
}

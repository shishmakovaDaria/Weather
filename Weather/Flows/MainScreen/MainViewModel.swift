//
//  MainViewModel.swift
//  Weather
//
//  Created by Дарья Шишмакова on 19.06.2025.
//

import Foundation

@MainActor
final class MainViewModel: ObservableObject {
    
    // MARK: - Publishers
    @Published var dayWeather: [DayWeatherModel] = []
    @Published var isLoading: Bool = false
    
    // MARK: - Services
    private let forecastService: ForecastServiceProtocol
    
    // MARK: - Life Cycle
    init(forecastService: ForecastServiceProtocol = ForecastService()) {
        self.forecastService = forecastService
    }
    
    // MARK: - Public methods
    func fetchWeather() {
        Task { [weak self] in
            guard let self else { return }
            
            self.isLoading = true
            defer { self.isLoading = false }
            
            do {
                let weatherForecast = try await forecastService.getForecast(for: Constants.defaultCity)
                self.dayWeather = weatherForecast.convertToDayWeather()
            } catch {
              //todo error handling
            }
        }
    }
}

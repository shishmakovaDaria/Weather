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
    @Published var weatherLocation: Location?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
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
                self.weatherLocation = weatherForecast.location
            } catch {
                let message: String

                switch error {
                case NetworkClientError.httpStatusCode(let code):
                    message = LocalizableStrings.serverError + " \(code)"
                case NetworkClientError.urlRequestError(let underlyingError):
                    message = [LocalizableStrings.requestError, underlyingError.localizedDescription].joined(separator: " ")
                case NetworkClientError.urlSessionError:
                    message = LocalizableStrings.networkError
                case NetworkClientError.parsingError:
                    message = LocalizableStrings.failedProcessData
                default:
                    message = LocalizableStrings.unknownError
                }

                self.errorMessage = message
            }
        }
    }
}

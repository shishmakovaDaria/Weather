//
//  ForecastService.swift
//  Weather
//
//  Created by Дарья Шишмакова on 19.06.2025.
//

import Foundation

protocol ForecastServiceProtocol {
    func getForecast(for city: String) async throws -> WeatherResponse
}

struct ForecastService: ForecastServiceProtocol {

    // MARK: - Properties
    private let networkClient: NetworkClientProtocol
    
    // MARK: - Life Cycle
    init(networkClient: NetworkClientProtocol = DefaultNetworkClient()) {
        self.networkClient = networkClient
    }
    
    // MARK: - Public methods
    func getForecast(for city: String) async throws -> WeatherResponse {
        let getForecastRequest = ForecastRequest(for: city)
        let response = try await networkClient.send(request: getForecastRequest, type: WeatherResponse.self)
        
        return response
    }
}

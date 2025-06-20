//
//  MainView.swift
//  Weather
//
//  Created by Дарья Шишмакова on 19.06.2025.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel = MainViewModel()
    @State private var showErrorAlert = false
    
    // MARK: - Body
    var body: some View {
        WeatherView(
            isLoading: viewModel.isLoading,
            dayWeather: viewModel.dayWeather,
            weatherLocation: viewModel.weatherLocation
        )
        .task {
            viewModel.fetchWeather()
        }
        .onReceive(viewModel.$errorMessage) { message in
            showErrorAlert = message != nil
        }
        .alert(
            LocalizableStrings.error,
            isPresented: $showErrorAlert
        ) {
            Button(LocalizableStrings.ok) {
                viewModel.errorMessage = nil
            }
        } message: {
            Text(viewModel.errorMessage ?? "")
        }
    }
}

#Preview {
    MainView()
}

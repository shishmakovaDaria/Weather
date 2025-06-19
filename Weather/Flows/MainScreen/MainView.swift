//
//  MainView.swift
//  Weather
//
//  Created by Дарья Шишмакова on 19.06.2025.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    
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
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2.0)
            } else if !viewModel.dayWeather.isEmpty {
                LazyVStack {
                    ForEach(viewModel.dayWeather) { dayWeather in
                        Text("\(dayWeather.temperature)")
                    }
                }
            }
        }
        .task {
            viewModel.fetchWeather()
        }
    }
}

#Preview {
    MainView()
}

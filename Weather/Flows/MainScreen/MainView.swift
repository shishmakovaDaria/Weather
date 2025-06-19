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
            VStack {
                HStack(spacing: 10) {
                    Image(systemName: "location.fill")
                    Text("Weather in Saint Petersburg")
                        .font(.title3)
                    Spacer()
                }
                .padding([.leading, .top], 16)
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .scaleEffect(2.0)
                } else if !viewModel.dayWeather.isEmpty {
                    ScrollView (showsIndicators: false) {
                        LazyVStack {
                            ForEach(viewModel.dayWeather) { dayWeather in
                                MainRowView(dayWeather: dayWeather)
                            }
                        }
                        .padding(.top, 16)
                    }
                    .padding([.leading, .trailing], 16)
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

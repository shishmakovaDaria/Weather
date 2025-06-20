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
                if viewModel.isLoading {
                    Spacer()
                    ProgressView()
                        .progressViewStyle(.circular)
                        .scaleEffect(2.0)
                } else if !viewModel.dayWeather.isEmpty {
                    HStack(spacing: 10) {
                        Image(systemName: "location.fill")
                        Text("\(viewModel.weatherLocation?.name ?? ""), \(viewModel.weatherLocation?.country ?? "")")
                            .font(.headline)
                    }
                    .padding(.top, 16)
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
                Spacer()
                Divider()
                Link(LocalizableStrings.accordingToLink,
                     destination: URL(string: "https://www.weatherapi.com/")!)
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.top, 5)
            }
        }
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

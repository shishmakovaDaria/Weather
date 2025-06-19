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
        Color.pink
            .ignoresSafeArea()
            .task {
                viewModel.fetchWeather()
            }
    }
}

#Preview {
    MainView()
}

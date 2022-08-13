//
//  
//  HomeView.swift
//  TEMPLATE
//
//  Created by Bruno Wide on 06/03/22.
//
//

import Foundation
import SwiftUI
import Combine

struct HomeView: View {

    @StateObject var vm: HomeViewModel = HomeViewModel()

    var body: some View {
        ZStack {
            Color.ds.primaryBackground
            
            VStack(spacing: .ds.spacing.medium) {
                Text(vm.cityName)
                    .font(.headline)
                weatherIcon
                Text(vm.formattedTemperature)
                    .font(.title)
                Text(vm.shortDescription)
                    .font(.body)
                Text(vm.formattedHighLow)
                    .font(.body)
                Text(vm.windInformation)
                    .font(.body)
            }
            .padding(.horizontal, .ds.spacing.medium)
        }
        .onAppear { vm.onAppear.send() }
        .alert(for: $vm.error)
    }
    
    @ViewBuilder
    var weatherIcon: some View {
        AsyncImage(url: vm.weatherIconURL) { image in
            image
                .resizable()
                .frame(width: 100, height: 100)
        } placeholder: {
            ProgressView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
        }
    }
}

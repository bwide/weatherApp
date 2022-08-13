//
//  
//  HomeModel.swift
//  TEMPLATE
//
//  Created by Bruno Wide on 06/03/22.
//
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {

    //MARK: - Static content
    var title: String = "Weather Details"
    
    //MARK: - Published
    @Published private var weather: WeatherResponse?
    @Published var error: RequestError?
    
    //MARK: - Interactions
    var onAppear: PassthroughSubject<Void, Never> = .init()

    init() {
        onAppear
            .flatMap { [service] in service.fetchWeather(latitude: 10, longitude: 10) }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.error = error
                case .finished: break
                }
            }, receiveValue: { [weak self] in
                self?.weather = $0
            })
            .store(in: &cancellables)
    }
    
    private var service: WeatherServiceProtocol = MockWeatherService()
    private var cancellables: Set<AnyCancellable> = []
}

extension HomeViewModel {
    //MARK: - Computed texts
    var cityName: String {
        weather?.name ?? "-"
    }
    
    var weatherIconURL: URL? {
        guard let icon = weather?.weather?.first?.icon else { return nil }
        return URL(string: "http://openweathermap.org/img/wn/\(icon)@2x.png")
    }
    
    var formattedTemperature: String {
        guard let temp = weather?.main?.temp else {
            return "-"
        }
        
        return formatted(temp: temp)
    }
    
    var shortDescription: String {
        weather?.weather?.first?.weatherDescription ?? "-"
    }
    
    var formattedHighLow: String {
        guard let high = weather?.main?.tempMax,
              let low = weather?.main?.tempMin
        else {
            return "-"
        }
        
        return "Low: \(formatted(temp: low)) High: \(formatted(temp: high))"
    }
    
    var windInformation: String {
        guard let speed = weather?.wind?.speed,
              let degrees = weather?.wind?.deg
        else {
            return "-"
        }
        return "Wind: \(speed) (\(degrees))"
    }
    
    private func formatted(temp: Double) -> String {
        MeasurementFormatter()
            .string(from: Measurement(value: temp,
                                      unit: UnitTemperature.kelvin))
    }
}

//
//  
//  HomeService.swift
//  TEMPLATE
//
//  Created by Bruno Wide on 06/03/22.
//
//

import Foundation
import UIKit
import Combine

protocol WeatherServiceProtocol: HTTPClient {
    func fetchWeather(latitude: Double, longitude: Double) -> AnyPublisher<WeatherResponse, RequestError>
}

struct WeatherService: WeatherServiceProtocol {
    func fetchWeather(latitude: Double, longitude: Double) -> AnyPublisher<WeatherResponse, RequestError> {
        publisher(for: WeatherRequest(latitude: latitude, longitude: longitude), responseModel: WeatherResponse.self)
            .map { print($0); return $0}
            .eraseToAnyPublisher()
    }
}

struct MockWeatherService: WeatherServiceProtocol {
    func fetchWeather(latitude: Double, longitude: Double) -> AnyPublisher<WeatherResponse, RequestError> {
//        Fail(error: RequestError.invalidURL).eraseToAnyPublisher()
        FixturesBuilder
            .build(fixtureType: WeatherResponse.self, from: "WeatherResponseFixture")
    }
}

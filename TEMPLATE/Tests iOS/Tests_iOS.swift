//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Bruno Wide on 06/03/22.
//

import XCTest
import Combine


class Tests_iOS: XCTestCase {
    
    func testWeatherDetail() throws {
        let expectation = self.expectation(description: "decode weather")
        var weather: WeatherResponse?
        
        MockWeatherService().fetchWeather(latitude: 10, longitude: 10)
            .sink(receiveCompletion: { _ in }) { response in
                weather = response
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 3)
        XCTAssertNotNil(weather)
    }
    
    var cancellables: Set<AnyCancellable> = []
}

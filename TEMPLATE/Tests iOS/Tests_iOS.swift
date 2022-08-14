//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Bruno Wide on 06/03/22.
//

import XCTest
import Combine
import SnapshotTesting
import SwiftUI


class Tests_iOS: XCTestCase {
    
    override func setUp() {
        TEMPLATEApp.container = MockContainerFactory.build()
    }
    
    func testHomeScreen() {
        let vm = HomeViewModel()
        let view = HomeView(vm: vm)
        let expectation = XCTestExpectation(description: "loaded weather")
        
        vm.refresh
            .delay(for: 1, scheduler: RunLoop.main)
            .sink { _ in expectation.fulfill() }
            .store(in: &cancellables)
        
        vm.refresh.send()
        wait(for: [expectation], timeout: 2)
        assertSnapshot(matching: view.toVC(), as: .image(on: .iPhoneX, precision: 0.95))
    }
    
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

extension View {
    func toVC() -> UIViewController {
        return UIHostingController(rootView: self)
    }
    
    func testingView() -> UIView {
        return UIHostingController(rootView: self).view
    }
}

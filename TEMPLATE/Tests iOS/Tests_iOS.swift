//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Bruno Wide on 06/03/22.
//

import XCTest

class Tests_iOS: XCTestCase {

    func testDecodeWeather() {
        //TODO: test mock data not nil
    }
    
    func testExample() throws {
        //TODO: test mock data with snapshot
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

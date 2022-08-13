//
//  RandomImageRequest.swift
//  TEMPLATE (iOS)
//
//  Created by Bruno Wide on 09/03/22.
//

import Foundation

struct WeatherRequest: Request {
    
    let latitude, longitude: Double
    
    var path: String {
        "weather"
    }
    
    var parameters: [String : Any]? {
        [
            "lat" : latitude,
            "lon": longitude
        ]
    }
}

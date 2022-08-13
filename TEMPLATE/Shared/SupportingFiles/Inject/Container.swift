//
//  Container.swift
//  TEMPLATE (iOS)
//
//  Created by Bruno Fulber Wide on 12/08/22.
//

import Foundation
import Swinject

struct ContainerFactory {
    static func build() -> Container {
        let container = Container()
        
        container.register(WeatherServiceProtocol.self) { _ in WeatherService() }
        
        return container
    }
}

struct MockContainerFactory {
    static func build() -> Container {
        let container = Container()
        
        container.register(WeatherServiceProtocol.self) { _ in MockWeatherService() }
        
        return container
    }
}

func inject<T: Any>() -> T {
    guard let dependency = TEMPLATEApp.container.resolve(T.self) else {
        fatalError("Failed to resolve dependency with type: \(String(describing: T.self))")
    }
    return dependency
}

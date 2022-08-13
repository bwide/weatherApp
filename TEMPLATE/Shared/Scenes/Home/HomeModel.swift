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
    @Published var weather: Weather?
    
    //MARK: - Interactions
    var onAppear: PassthroughSubject<Void, Never> = .init()

    init() {
        onAppear
            .flatMap { [service] in service.fetchWeather(latitude: 10, longitude: 10) }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error) // alert
                case .finished: break
                }
            }, receiveValue: { [weak self] _ in
//                self?.weather = $0
            })
            .store(in: &cancellables)
    }
    
    private var service: WeatherServiceProtocol = inject()
    private var cancellables: Set<AnyCancellable> = []
}

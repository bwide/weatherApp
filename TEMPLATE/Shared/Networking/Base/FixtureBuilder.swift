//
//  FixtureBuilder.swift
//  TEMPLATE
//
//  Created by Bruno Fulber Wide on 13/08/22.
//

import Foundation
import Combine

class FixturesBuilder {

    static func build<T: Decodable>(fixtureType: T.Type, from file: String) -> AnyPublisher<T, RequestError> {
        return Future { promise in
            DispatchQueue.global(qos: .background).async {
                let bundle = Bundle(for: FixturesBuilder.self)
                let fixturePath = bundle.path(forResource: file, ofType: "json")!
                let fixtureData = try! Data(contentsOf: URL(fileURLWithPath: fixturePath))
                do {
                    let result = try JSONDecoder().decode(T.self, from: fixtureData)
                    promise(.success(result))
                } catch {
                    print("FixturesBuilder: Parsing error for \(T.self) decoding fixture \(file): \(error)")
                    promise(.failure(RequestError.decode))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

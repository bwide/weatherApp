//
//  HTTPClient.swift
//  TEMPLATE (iOS)
//
//  Created by Bruno Wide on 09/03/22.
//

import Foundation
import Combine

protocol HTTPClient {
    func publisher<T: Decodable>(for request: Request, responseModel: T.Type) -> AnyPublisher<T, RequestError>
}

extension HTTPClient {
    func publisher<T: Decodable>(for request: Request, responseModel: T.Type) -> AnyPublisher<T, RequestError> {
        guard let request = try? request.urlRequest else {
            return Fail(error: RequestError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse else { throw RequestError.noResponse }

                switch response.statusCode {
                case 200...299: return data
                case 401: throw RequestError.unauthorized
                default: throw RequestError.unexpectedStatusCode
                }
            }
            .decode(type: responseModel, decoder: JSONDecoder())
            .mapError { error -> RequestError in
                if let error = error as? RequestError {
                    return error
                } else {
                    return RequestError.unknown(error)
                }
            }
            .eraseToAnyPublisher()
    }
}

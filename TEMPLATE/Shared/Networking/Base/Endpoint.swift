//
//  Endpoint.swift
//  TEMPLATE (iOS)
//
//  Created by Bruno Wide on 09/03/22.
//

import Foundation

protocol Request {
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: [String: Any]? { get }
    var header: [String: String]? { get }
    var body: [String: Any]? { get }
}

extension Request {
    var key: String { "d4277b87ee5c71a468ec0c3dc311a724" }
    var fullPath: String { "\(baseURL)/\(path)" }
    var baseURL: String { "https://api.openweathermap.org/data/2.5" }

    var method: RequestMethod { .get }
    var parameters: [String: Any]? { nil }
    var header: [String: String]? { nil }
    var body: [String: Any]? { nil }
}

extension Request {
    var urlRequest: URLRequest {
        get throws {
            guard let url = URL(string: fullPath) else { throw RequestError.invalidURL }

            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
            
            var queryItems = parameters?.reduce(into: [], { partialResult, item in
                partialResult.append(URLQueryItem(name: item.key, value: "\(item.value as Any)"))
            }) ?? []
            
            queryItems.append(contentsOf: [
               URLQueryItem(name: "appid", value: key)
            ])
            
            components.queryItems = queryItems

            var ans = URLRequest(url: components.url!)
            ans.httpMethod = method.rawValue
            ans.allHTTPHeaderFields = header

            if let body = body {
                ans.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            }

            print("\(method.rawValue): \(components.url!)")
            return ans
        }
    }
}

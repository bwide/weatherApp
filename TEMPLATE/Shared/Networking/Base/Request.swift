//
//  Request.swift
//  TEMPLATE (iOS)
//
//  Created by Bruno Wide on 09/03/22.
//

import Foundation

protocol DisplayableError: Error {
    var userDescription: String { get }
}

enum RequestMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}

enum RequestError: DisplayableError {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown(Error)
    
    var userDescription: String {
        switch self {
        case .decode: return "Decode error"
        case .unauthorized: return "Session expired"
        default: return "Unknown error"
        }
    }
}

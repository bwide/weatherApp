//
//  Request.swift
//  TEMPLATE (iOS)
//
//  Created by Bruno Wide on 09/03/22.
//

import Foundation

protocol DisplayableError: Error {
    var alertTitle: String { get }
    var alertDescription: String { get }
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
    
    var alertTitle: String {
        switch self {
        default: return "Error"
        }
    }
    
    var alertDescription: String {
        switch self {
        case .decode: return "Error decoding value"
        case .unauthorized: return "Session expired"
        default: return "Unknown error"
        }
    }
}

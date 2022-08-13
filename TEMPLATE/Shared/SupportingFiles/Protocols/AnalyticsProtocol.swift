//
//  AnalyticsProtocol.swift
//  Instagram Tracker
//
//  Created by Bruno Wide on 20/02/22.
//

import Foundation
import Combine

protocol ScreenAnalyticsProtocol {
    associatedtype Model: ModelProtocol

    /// store subscriptions done in logEvents
    var subscriptions: Set<AnyCancellable> { get set }

    var screenName: String { get }

    /// should observe values from this model and log analytics
    func logEvents(from model: Model)
}

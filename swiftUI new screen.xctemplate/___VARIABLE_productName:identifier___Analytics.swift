//
//  ___FILEHEADER___
//

import Foundation
import Combine

class ___VARIABLE_productName:identifier___Analytics: ScreenAnalyticsProtocol {

    typealias Model = ___VARIABLE_productName:identifier___Model
    var subscriptions: Set<AnyCancellable> = []

    let screenName = "___VARIABLE_productName:identifier___"

    func logEvents(from model: ___VARIABLE_productName:identifier___Model) {
        let enteredEvent = AnalyticsEvent(screen: screenName,
                                          name: "navigate \(screenName)")
        Analytics.shared.log(event: enteredEvent)
    }
}

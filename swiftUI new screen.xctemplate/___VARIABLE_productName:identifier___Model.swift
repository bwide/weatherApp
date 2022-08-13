//
//  ___FILEHEADER___
//

import Foundation
import Combine
import SwiftUI

class ___VARIABLE_productName:identifier___Model: ModelProtocol {

    @Published var navigationRoute: ___VARIABLE_productName:identifier___Route?
    var analytics: ___VARIABLE_productName:identifier___Analytics = ___VARIABLE_productName:identifier___Analytics()
    private var service: ___VARIABLE_productName:identifier___ServiceProtocol

    var title: String = "___VARIABLE_productName:identifier___"

    init(service: ___VARIABLE_productName:identifier___ServiceProtocol = ___VARIABLE_productName:identifier___Service()) {
        self.service = service
    }

    func didAppear() {
        analytics.logEvents(from: self)
    }
}

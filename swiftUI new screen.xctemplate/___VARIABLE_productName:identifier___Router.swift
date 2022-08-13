//
//  ___FILEHEADER___
//

import Foundation
import SwiftUI

enum ___VARIABLE_productName:identifier___Route: String, RouteType {
    var id: RawValue { rawValue }

    case start
}

struct ___VARIABLE_productName:identifier___Router: Routing {
    @ViewBuilder
    func view(for route: ___VARIABLE_productName:identifier___Route) -> some View {
        switch route {
        case .start:
            ___VARIABLE_productName:identifier___View<___VARIABLE_productName:identifier___Router>(model: ___VARIABLE_productName:identifier___Model(), router: self)
        }
    }
}

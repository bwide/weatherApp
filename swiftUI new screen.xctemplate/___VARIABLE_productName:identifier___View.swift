//
//  ___FILEHEADER___
//

import Foundation
import SwiftUI
import Combine

struct ___VARIABLE_productName:identifier___View<Router: Routing>: AppView {

    @ObservedObject var model: ___VARIABLE_productName:identifier___Model = ___VARIABLE_productName:identifier___Model()
    var router: Router
    var modelObservedObject: ObservedObject<___VARIABLE_productName:identifier___Model>.Wrapper { $model }

    var body: some View {
        ZStack {
            navigationLinks
            Color.black
            Text(model.title)
        }
    }
}

struct ___VARIABLE_productName:identifier___View_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ___VARIABLE_productName:identifier___View<___VARIABLE_productName:identifier___Router>(router: ___VARIABLE_productName:identifier___Router())
                .environmentObject(___VARIABLE_productName:identifier___Mocks.defaultMock)
        }
    }
}

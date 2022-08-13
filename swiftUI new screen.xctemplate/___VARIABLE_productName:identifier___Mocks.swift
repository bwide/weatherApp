//
//  ___FILEHEADER___
//

import Foundation

struct ___VARIABLE_productName:identifier___Mocks: MockProtocol {

    typealias Model = ___VARIABLE_productName:identifier___Model

    var allMocks: [Model] = [
        defaultMock
    ]

    static let defaultMock: ___VARIABLE_productName:identifier___Model = {
        ___VARIABLE_productName:identifier___Model(service: ___VARIABLE_productName:identifier___ServiceMock())
    }()
}

struct ___VARIABLE_productName:identifier___ServiceMock: ___VARIABLE_productName:identifier___ServiceProtocol {
    
}

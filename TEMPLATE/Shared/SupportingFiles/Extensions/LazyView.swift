//
//  LazyView.swift
//  Perimeter
//
//  Created by Bruno Wide on 21/02/22.
//

import Foundation
import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content

    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

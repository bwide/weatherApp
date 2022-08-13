//
//  LazyView.swift
//  Perimeter
//
//  Created by Bruno Wide on 21/02/22.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func alert<T: DisplayableError>(for error: Binding<T?>) -> some View {
        self
            .alert(
                error.wrappedValue?.alertTitle ?? "",
                isPresented: .constant(error.wrappedValue != nil)) {
                    Button("OK") { error.wrappedValue = nil }
                } message: {
                    Text(error.wrappedValue?.alertDescription ?? "")
                }

    }
}

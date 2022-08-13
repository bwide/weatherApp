//
//  Preview+Extensions.swift
//  Perimeter
//
//  Created by Bruno Wide on 27/01/22.
//

import Foundation
import SwiftUI

extension View {
    /// creates multiple preview devices for light, dark mode and dynamic type sizes
    @ViewBuilder
    func previewAllDevices(accessibilitySizes: Bool = false) -> some View {
        Group {
            self
                .preferredColorScheme(.light)
                .previewDisplayName("Light mode")
            self
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark mode")
            ForEach(["iPhone SE (2nd generation)", "iPhone 13 mini", "iPhone 13 Pro Max"], id: \.self) {
                self
                    .preferredColorScheme(.dark)
                    .previewDevice(PreviewDevice(rawValue: $0))
                    .previewDisplayName($0)
            }
            if accessibilitySizes, #available(iOS 15.0, *) {
                previewAccessibility()
            }
        }
    }

    @ViewBuilder
    @available(iOS 15.0, *)
    func previewAccessibility() -> some View {
        ForEach(DynamicTypeSize.allCases, id: \.self) { size in
            self
                .dynamicTypeSize(size)
                .previewDisplayName(String(describing: size))
        }
    }

}

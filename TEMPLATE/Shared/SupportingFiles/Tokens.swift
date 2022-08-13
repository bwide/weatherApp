//
//  Tokens.swift
//  TEMPLATE (iOS)
//
//  Created by Bruno Fulber Wide on 12/08/22.
//

import Foundation
import SwiftUI

extension Color {
    static let ds: DSColors = DSColors()
}

struct DSColors {
    let primaryBackground: Color = Color(uiColor: .systemBackground)
    let primaryFont: Color = .primary
}

extension CGFloat {
    static let ds = DSFloats()
}

struct DSFloats {
    let spacing = DSSpacings()
}

struct DSSpacings {
    /// 24
    let medium: CGFloat = 24
}

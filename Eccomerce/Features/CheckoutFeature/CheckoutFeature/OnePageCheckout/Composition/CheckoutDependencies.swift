//
//  CheckoutDependencies.swift
//  CheckoutFeature
//
//  Created by RODRIGO FRANCISCO PABLO on 10/04/24.
//

import SwiftUI
import Combine

public final class Theme: ObservableObject {
    public let primaryColor: Color
    let backgroundColor: Color
    
    public init(primaryColor: Color, backgroundColor: Color) {
        self.primaryColor = primaryColor
        self.backgroundColor = backgroundColor
    }
    
    public static let `default` = Theme(
        primaryColor: Color(red: 225/255, green: 0, blue: 152/255),
        backgroundColor: Color(red: 0.84, green: 0.84, blue: 0.84,opacity: 0.2))
}

public struct CheckoutDependencies {
    @ObservedObject public var theme: Theme
    
    public init(theme: Theme) {
        self.theme = theme
    }
}

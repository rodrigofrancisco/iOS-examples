//
//  AirtimeDependencies.swift
//  AirtimeFeature
//
//  Created by Rodrigo Francisco on 26/12/23.
//

import SwiftUI

public final class Theme: ObservableObject {
    public let primaryColor: Color
    public let backgroundColor: Color = Color(red: 0.84, green: 0.84, blue: 0.84,opacity: 0.2)
    public let primaryFont: Font?
    
    public init(primaryColor: Color, backgroundColor: Color, primaryFont: Font? = nil) {
        self.primaryColor = primaryColor
        self.primaryFont = primaryFont
    }
    
    static let `default` = Theme(
        primaryColor: Color(red: 225/255, green: 0, blue: 152/255),
        backgroundColor: Color(red: 0.84, green: 0.84, blue: 0.84,opacity: 0.2)
    )
}

/// Place here the style and feature flag dependencies
public struct AirtimeDependencies {
    @ObservedObject public var theme: Theme
    
    public init(theme: Theme) {
        self.theme = theme
    }
}

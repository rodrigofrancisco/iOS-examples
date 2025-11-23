//
//  View+CardStyle.swift
//  GEC
//
//  Created by Rodrigo Francisco on 29/11/23.
//

import SwiftUI

struct CardStyleModifier: ViewModifier {
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(radius: 4)
    }
}

extension View {
    func cardStyle(backgroundColor: Color) -> some View {
        modifier(CardStyleModifier(backgroundColor: backgroundColor))
    }
}

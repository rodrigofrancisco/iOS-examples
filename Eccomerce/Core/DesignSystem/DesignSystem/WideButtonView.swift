//
//  StickyBottomComponent.swift
//  GEC
//
//  Created by Rodrigo Francisco on 25/11/23.
//

import SwiftUI

public struct WideButtonView: View {
    private let title: String
    private let backgroundColor: Color
    
    private let callback: (() -> ())?
    
    public var body: some View {
        Button(action: {
            callback?()
        }, label: {
            Text(title)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(backgroundColor)
                //.fontWeight(.semibold)
        }).padding()
    }
    
    public init(title: String, backgroundColor: Color, callback: (() -> ())? = nil) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.callback = callback
    }
}

#Preview {
    WideButtonView(title: "Terminar compra", backgroundColor: Color(red: 225/255, green: 0, blue: 152/255))
}

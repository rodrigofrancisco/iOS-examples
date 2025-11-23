//
//  StickyBottomComponent.swift
//  GEC
//
//  Created by Rodrigo Francisco on 25/11/23.
//

import SwiftUI

struct WideButtonView: View {
    private let title: String
    
    var body: some View {
        Button(action: {
            print("Do nothing")
        }, label: {
            Text(title)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(.pink)
        }).padding()
    }
    
    init(title: String) {
        self.title = title
    }
}

#Preview {
    WideButtonView(title: "Terminar compra")
}

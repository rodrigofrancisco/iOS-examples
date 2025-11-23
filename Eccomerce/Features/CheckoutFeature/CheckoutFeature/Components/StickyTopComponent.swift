//
//  StickyTopComponent.swift
//  GEC
//
//  Created by Rodrigo Francisco on 25/11/23.
//

import SwiftUI

struct StickyTopComponent: View {
    private let totalAmount: String
    
    var body: some View {
        HStack {
            Text("Confirma tu compra")
                .bold()
            Spacer()
            Group {
                Text("Total: ")
                Text(totalAmount)
                    .foregroundStyle(Color.red)
            }
            
        }
        .padding()
        .background(.white)
    }
    
    init(totalAmount: String) {
        self.totalAmount = totalAmount
    }
}

#Preview {
    StickyTopComponent(totalAmount: "$1,999.00")
}

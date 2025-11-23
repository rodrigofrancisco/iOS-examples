//
//  StickyTopComponent.swift
//  GEC
//
//  Created by Rodrigo Francisco on 25/11/23.
//

import SwiftUI

struct StickyTopComponent: View {
    var body: some View {
        HStack {
            Text("Confirma tu compra")
                .bold()
            Spacer()
            Text("Total: $1,999.00")
        }
        .padding()
        .background(.white)
    }
}

#Preview {
    StickyTopComponent()
}

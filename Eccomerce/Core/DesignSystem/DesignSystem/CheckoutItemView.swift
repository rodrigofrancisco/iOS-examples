//
//  CheckoutItemView.swift
//  GEC
//
//  Created by RODRIGO FRANCISCO PABLO on 11/11/23.
//

import SwiftUI

public struct CheckoutItemView<ComponentView: View>: View {
    
    public let titleItem: String
    public let component: ComponentView
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(titleItem)
                .bold()
                .font(.caption)
                .padding(.all, 10)
            VStack(alignment: .leading) {
                component
                    .padding()
            }
            .cardStyle(backgroundColor: .white)
            .padding([.leading, .trailing], 10)
        }
    }
    
    public init(titleItem: String, @ViewBuilder component: () -> ComponentView) {
        self.titleItem = titleItem
        self.component = component()
    }
}

struct CheckoutItemView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutItemView(titleItem: "1. Entrega") {
            VStack {
                Text("This is test")
                Text("This is test")
            }

        }
    }
}

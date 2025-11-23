//
//  PurchaseSummaryView.swift
//  GEC
//
//  Created by Rodrigo Francisco on 25/11/23.
//

import SwiftUI

struct SummaryItemView: View {
    private let concept: String
    private let amount: String
    
    var body: some View {
        HStack {
            Text(concept)
            Spacer()
            Text(amount)
        }
    }
    
    init(concept: String, amount: String) {
        self.concept = concept
        self.amount = amount
    }
}

struct PurchaseSummaryView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Resumen de compra")
                .bold()
                .padding(.all, 10)
            GenericCardContainerView {
                HStack {
                    Text("Cupones")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
            GenericCardContainerView {
                VStack(spacing: 12) {
                    SummaryItemView(concept: "Subtotal (1 producto):", amount: "$9,999.00")
                    SummaryItemView(concept: "Descuento:", amount: "$0.00")
                    SummaryItemView(concept: "Coupones:", amount: "$0.00")
                    SummaryItemView(concept: "Costo de envío:", amount: "Gratis")
                    Divider()
                    SummaryItemView(concept: "Total (IVA incluido", amount: "$1,999.00")
                }
            }
        }
    }
}

#Preview {
    PurchaseSummaryView()
}

//
//  AirtimePurchaseSummaryView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 11/12/23.
//

import SwiftUI

struct AirtimePurchaseSummaryView: View {
    var body: some View {
        GenericCardContainerView {
            VStack(alignment: .leading, spacing: 12) {
                Text("Resumen de mi recarga").bold()
                Divider()
                SummaryItemView(concept: "Subtotal (1 recarga):", amount: "$30.00")
                SummaryItemView(concept: "Total:", amount: "$30.00")
            }
        }
    }
}

#Preview {
    AirtimePurchaseSummaryView()
}

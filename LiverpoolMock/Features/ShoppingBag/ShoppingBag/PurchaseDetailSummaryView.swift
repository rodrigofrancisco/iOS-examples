//
//  PurchaseSummaryView.swift
//  SharedComponents
//
//  Created by Rodrigo Francisco on 24/12/23.
//

import SwiftUI

public struct PurchaseDetailSummaryView: View {
    public var body: some View {
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
    
    public init() {}
}
#Preview {
    PurchaseDetailSummaryView()
}

//
//  PurchaseSummaryView.swift
//  SharedComponents
//
//  Created by Rodrigo Francisco on 24/12/23.
//

import SwiftUI

public struct PurchaseDetailSummaryView: View {
    
    private let viewModel: PurchaseSummaryDetailViewModel
    
    public var body: some View {
        GenericCardContainerView {
            VStack(spacing: 12) {
                SummaryItemView(concept: "Subtotal (\(viewModel.numberOfProductsFormated)):", amount: viewModel.subtotalAmount)
                SummaryItemView(concept: "Descuento:", amount: viewModel.discountAmount)
                SummaryItemView(concept: "Coupones:", amount: viewModel.couponsAmount)
                SummaryItemView(concept: "Costo de envío:", amount: viewModel.shippingCostAmount)
                Divider()
                totalAmountComponent
            }
        }
    }
    
    private var totalAmountComponent: some View {
        HStack {
            Text("Total (IVA incluido)")
                .fontWeight(.bold)
            Spacer()
            Text(viewModel.totalAmount)
                .fontWeight(.bold)
                .foregroundStyle(.red)
        }
    }
    
    public init(viewModel: PurchaseSummaryDetailViewModel) {
        self.viewModel = viewModel
    }
}
#Preview {
    PurchaseDetailSummaryView(viewModel: PurchaseSummaryDetailViewModel(numberOfProducts: 2, subtotalAmount: "$9,999.00", discountAmount: "$0.00", couponsAmount: "$0.00", shippingCostAmount: "Gratis", totalAmount: "$1,999.00"))
}

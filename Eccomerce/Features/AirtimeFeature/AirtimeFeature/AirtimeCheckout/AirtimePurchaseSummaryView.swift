//
//  AirtimePurchaseSummaryView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 11/12/23.
//

import SwiftUI
import DesignSystem

struct AirtimePurchaseSummaryViewModel {
    let numberOfPackages: String
    let subTotalAmount: String
    let totalAmount: String
}

struct AirtimePurchaseSummaryView: View {
    private enum Constants {
        static let title = "Resumen de mi recarga"
        static let total = "Total:"
    }
    
    private let viewModel: AirtimePurchaseSummaryViewModel
    
    var body: some View {
        GenericCardContainerView {
            VStack(alignment: .leading, spacing: 12) {
                Text(Constants.title).bold()
                Divider()
                SummaryItemView(concept: "Subtotal (\(viewModel.numberOfPackages):", amount: viewModel.subTotalAmount)
                SummaryItemView(concept: Constants.total, amount: viewModel.totalAmount)
            }
        }
    }
    
    init(viewModel: AirtimePurchaseSummaryViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    AirtimePurchaseSummaryView(viewModel: .fake)
}

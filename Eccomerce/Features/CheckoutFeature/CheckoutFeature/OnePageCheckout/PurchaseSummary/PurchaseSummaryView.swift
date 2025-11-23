//
//  PurchaseSummaryView.swift
//  GEC
//
//  Created by Rodrigo Francisco on 25/11/23.
//

import SwiftUI
import DesignSystem

struct PurchaseSummaryView: View {
    
    private let viewModel: PurchaseSummaryDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Resumen de compra")
                .bold()
                .font(.caption)
                .padding(.all, 10)
            GenericCardContainerView {
                HStack {
                    Text("Cupones")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
            PurchaseDetailSummaryView(viewModel: viewModel)
        }
    }
    
    init(viewModel: PurchaseSummaryDetailViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    PurchaseSummaryView(viewModel: .fake)
}

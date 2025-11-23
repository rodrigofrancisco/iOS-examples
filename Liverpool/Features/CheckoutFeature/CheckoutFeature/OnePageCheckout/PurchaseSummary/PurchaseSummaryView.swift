//
//  PurchaseSummaryView.swift
//  GEC
//
//  Created by Rodrigo Francisco on 25/11/23.
//

import SwiftUI
import SharedComponents

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
            PurchaseDetailSummaryView()
        }
    }
}

#Preview {
    PurchaseSummaryView()
}

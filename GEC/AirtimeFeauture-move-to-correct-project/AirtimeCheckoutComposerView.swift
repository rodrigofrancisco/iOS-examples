//
//  AirtimeCheckoutComposerView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 11/12/23.
//

import SwiftUI

struct AirtimeCheckoutComposerView: View {
    var body: some View {
        VStack {
            PaymentFormView(viewModel: .fake)
            AirtimePurchaseSummaryView()
        }
    }
}

#Preview {
    AirtimeCheckoutComposerView()
}

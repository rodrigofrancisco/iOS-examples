//
//  AirtimeCheckoutComposerView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 11/12/23.
//

import SwiftUI
import SharedComponents

struct AirtimeCheckoutComposerView: View {
    let primaryColor500: Color = Color(red: 225/255, green: 0, blue: 152/255)
    var body: some View {
        VStack {
            AirtimeCheckoutPhoneNumberListView()
            PaymentFormView(viewModel: .fake)
            AirtimePurchaseSummaryView()
            WideButtonView(title: "Finalizar recarga", backgroundColor: primaryColor500)
        }
    }
}

#Preview {
    AirtimeCheckoutComposerView()
}

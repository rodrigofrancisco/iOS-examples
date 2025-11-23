//
//  PaymentCardsListView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 01/12/23.
//

import SwiftUI

struct PaymentCardsListView: View {
    @EnvironmentObject private var theme: Theme
    var body: some View {
        AirtimeGenericListView(title: "2. Selecciona tu forma de pago", actionName: "Agregar tarjeta", itemsView: {
            VStack {
                PaymentCardView(viewModel: .fake)
                PaymentCardView(viewModel: .fake)
                PaymentCardView(viewModel: .fake)
                PaymentCardView(viewModel: .fake)
            }
        })
        .environmentObject(theme)
    }
}

#Preview {
    PaymentCardsListView()
        .environmentObject(Theme.default)
}

//
//  AirtimeCheckoutPhoneNumberListView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 11/12/23.
//

import SwiftUI

struct AirtimeCheckoutPhoneNumberListView: View {
    var body: some View {
        CheckoutItemView(titleItem: "1. Números a recargar") {
            HStack {
                Text("Rodrigo - ")
                Text("5577299882")
                Spacer()
                Text("AT&T 30 Pesos")
            }
        }
    }
}

#Preview {
    AirtimeCheckoutPhoneNumberListView()
}

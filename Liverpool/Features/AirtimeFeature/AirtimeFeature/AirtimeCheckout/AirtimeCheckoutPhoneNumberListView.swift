//
//  AirtimeCheckoutPhoneNumberListView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 11/12/23.
//

import SwiftUI
import SharedComponents

struct AirtimeCheckoutPhoneNumberListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("1. Números a recargar")
                .bold()
                .padding(.all, 10)
            VStack(alignment: .leading) {
                phoneNumberItem
                phoneNumberItem
            }
            HStack {
                Spacer()
                Text("Editar")
                    .underline()
            }
        }
        .padding([.leading, .trailing], 10)
    }
    
    var phoneNumberItem: some View {
        HStack {
            Text("Rodrigo - ")
                .bold()
            Text("5577299882")
            Spacer()
            Text("AT&T 30 Pesos")
        }
        .padding()
        .cardStyle(backgroundColor: .white)
    }
}

#Preview {
    AirtimeCheckoutPhoneNumberListView()
}

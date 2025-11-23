//
//  PhoneNumbersListView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 01/12/23.
//

import SwiftUI

struct PhoneNumbersListView: View {
    var body: some View {
        AirtimeGenericListView(title: "1. selecciona tus números a recargar", actionName: "Agregar teléfono", itemsView: {
            VStack {
                PhoneNumberInfoView(viewModel: .fake)
                PhoneNumberInfoView(viewModel: .fake)
            }
        })
    }
}

#Preview {
    PhoneNumbersListView()
}

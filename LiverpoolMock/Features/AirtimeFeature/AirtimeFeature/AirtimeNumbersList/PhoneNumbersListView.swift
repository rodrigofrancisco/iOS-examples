//
//  PhoneNumbersListView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 01/12/23.
//

import SwiftUI
import SharedComponents

struct PhoneNumbersListView: View {
    enum Constants {
        static let title = "1. selecciona tus números a recargar"
        static let addPhoneText = "Agregar teléfono"
    }
    
    @EnvironmentObject private var navigator: AirtimeNavigator
    @EnvironmentObject private var theme: Theme
    private let viewModel: PhoneNumbersListViewModel
    
    var body: some View {
        AirtimeGenericListView(title: Constants.title, actionName: Constants.addPhoneText, itemsView: {
            VStack {
                ForEach(ForEachWrapper.wrap(viewModel.phoneNumbersInfo)) {
                    PhoneNumberInfoView(viewModel: $0.viewModel)
                }
            }
        }, callback: didTapContinue)
        .environmentObject(theme)
    }
    
    init(viewModel: PhoneNumbersListViewModel) {
        self.viewModel = viewModel
    }
    
    private func didTapContinue() {
        navigator.navigate(to: .checkout)
    }
}

#Preview {
    PhoneNumbersListView(viewModel: .fake)
        .environmentObject(Theme.default)
}

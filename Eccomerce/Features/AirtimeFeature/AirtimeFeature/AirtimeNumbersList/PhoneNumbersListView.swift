//
//  PhoneNumbersListView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 01/12/23.
//

import SwiftUI
import DesignSystem

struct PhoneNumbersListView: View {
    enum Constants {
        static let title = "1. selecciona tus números a recargar"
        static let addPhoneText = "Agregar teléfono"
    }
    
    @EnvironmentObject private var navigator: AirtimeNavigator
    @EnvironmentObject private var theme: Theme
    private let viewModel: PhoneNumbersListViewModel
    @State private var notificationAlert: AlertNotification?
    
    var body: some View {
        AirtimeGenericListView(title: Constants.title, 
                               actionName: Constants.addPhoneText,
                               itemsView: { content },
                               callback: didTapContinue)
        .environmentObject(theme)
        .notificationAlert(alert: notificationAlert, dismissAction: alertDismissAction)
    }
    
    var content: some View {
        VStack {
            ForEach(ForEachWrapper.wrap(viewModel.phoneNumbersInfo)) {
                PhoneNumberInfoView(viewModel: $0.wrappedValue)
            }
        }
    }
    
    init(viewModel: PhoneNumbersListViewModel) {
        self.viewModel = viewModel
    }

    private func didTapContinue() {
        switch viewModel.handleContinueAction() {
        case .success:
            goToCheckout()
        case .failure(let error):
            popAlertAction(error: error)
        }
    }
    
    private func goToCheckout() {
        let selectedPhoneNumbers = self.viewModel.phoneNumbersInfo.filter({ $0.isSelected })
        let dependencies = AirtimeCheckoutViewModel.Dependencies(selectedPhoneNumbers: selectedPhoneNumbers, defaultPaymentForm: .fake)
        let viewModel = AirtimeCheckoutViewModel(dependencies: dependencies)
        navigator.navigate(to: .checkout(viewModel: viewModel))
    }
    
    private func popAlertAction(error: Error) {
        notificationAlert = AlertNotification.error(message: error.localizedDescription)
    }
    
    private func alertDismissAction() {
        notificationAlert = nil
    }
}

extension AirtimeCheckoutViewModel.Dependencies {
    init(selectedPhoneNumbers: [PhoneNumberInfoViewModel], defaultPaymentForm: PaymentFormViewModel) {
        self.selectedPhoneNumbers = selectedPhoneNumbers.map {
            AirtimePhoneNumberModel(phoneNickname: $0.nickNamePhone, phoneNumber: $0.phoneNumber, packageChose: $0.carrier) }
        self.defaultPaymentForm = defaultPaymentForm
    }
}

#Preview {
    PhoneNumbersListView(viewModel: .fake)
        .environmentObject(Theme.default)
}

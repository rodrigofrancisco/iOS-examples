//
//  AirtimeCheckoutComposerView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 11/12/23.
//

import SwiftUI
import DesignSystem

struct AirtimeCheckoutViewModel {
    struct Dependencies {
        let selectedPhoneNumbers: [AirtimePhoneNumberModel]
        let defaultPaymentForm: PaymentFormViewModel
    }
    
    let dependencies: Dependencies
    
    var purchaseSummary: AirtimePurchaseSummaryViewModel {
        // TODO: Subtitute with logic to now the real amount
        AirtimePurchaseSummaryViewModel.fake
    }
}

struct AirtimeCheckoutComposerView: View {
    private enum Constants {
        static let title = "Tiempo Aire"
        static let buttonText = "Finalizar recarga"
    }
    
    private let viewModel: AirtimeCheckoutViewModel
    
    @EnvironmentObject var theme: Theme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ScrollView {
            VStack {
                AirtimeCheckoutPhoneNumberListView(viewModel: viewModel.dependencies.selectedPhoneNumbers, editHandler: {})
                PaymentFormView(viewModel: viewModel.dependencies.defaultPaymentForm)
                AirtimePurchaseSummaryView(viewModel: viewModel.purchaseSummary)
                WideButtonView(title: Constants.buttonText, backgroundColor: theme.primaryColor)
            }
        }
        .padding([.top], 10)
        .navigationTitle(Constants.title)
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: makeBackButton { self.presentationMode.wrappedValue.dismiss() })
    }
    
    init(viewModel: AirtimeCheckoutViewModel ) {
        self.viewModel = viewModel
    }
}

#Preview {
    AirtimeCheckoutComposerView(viewModel: .fake)
        .environmentObject(Theme.default)
}

//
//  CheckoutMainView.swift
//  GEC
//
//  Created by RODRIGO FRANCISCO PABLO on 11/11/23.
//

import SwiftUI
import DesignSystem

struct CheckoutMainView: View {
    
    private enum Constants {
        static let finishPurchase = "Terminar compra"
    }
    
    private let viewModel: CheckoutMainViewModel
    private let dependencies: CheckoutDependencies

    public var body: some View {
        mainView
        .navigationTitle(viewModel.checkoutTitle)
        .navigationBarTitleDisplayMode(.inline)
        .environmentObject(dependencies.theme)
    }
    
    private var mainView: some View {
        VStack {
            summaryHeaderView
            ScrollView {
                VStack(alignment: .leading) {
                    DeliveryView(viewModel: viewModel.deliveryViewModel)
                    PaymentFormView(viewModel: viewModel.paymentViewModel)
                    ProductsListView(viewModels: viewModel.productsViewModel)
                    PurchaseSummaryView(viewModel: viewModel.purchaseDetailSummaryViewModel)
                    TermsAndPrivacyView()
                }
            }
            .background(dependencies.theme.backgroundColor)
            stickyBottomComponent
        }
    }
    
    private var summaryHeaderView: some View {
        StickyTopComponent(totalAmount: viewModel.purchaseDetailSummaryViewModel.totalAmount)
    }
    
    private var stickyBottomComponent: some View {
        WideButtonView(title: Constants.finishPurchase,
                       backgroundColor: dependencies.theme.primaryColor)
    }
    
    init(viewModel: CheckoutMainViewModel, dependencies: CheckoutDependencies) {
        self.viewModel = viewModel
        self.dependencies = dependencies
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutMainView(viewModel: .fake, dependencies: CheckoutDependencies(theme: .default))
    }
}

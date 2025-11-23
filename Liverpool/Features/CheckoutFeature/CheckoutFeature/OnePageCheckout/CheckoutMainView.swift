//
//  CheckoutMainView.swift
//  GEC
//
//  Created by RODRIGO FRANCISCO PABLO on 11/11/23.
//

import SwiftUI
import SharedComponents

public struct CheckoutMainView: View {
    
    private enum Constants {
        static let navigationTitle = "Liverpool Pocket"
        static let finishPurchase = "Terminar compra"
    }
    
    public struct AppearanceModel {
        let backgroundColor: Color
        
        public init(backgroundColor: Color = Color(red: 0.84, green: 0.84, blue: 0.84,opacity: 0.2)) {
            self.backgroundColor = backgroundColor
        }
    }
    
    private let appearanceModel: AppearanceModel

    public var body: some View {
        NavigationStack {
            mainView
                .navigationTitle(Constants.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color(red: 225/255, green: 0, blue: 152/255), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    private var mainView: some View {
        VStack {
            StickyTopComponent()
            ScrollView {
                VStack(alignment: .leading) {
                    DeliveryView(viewModel: .fake)
                    PaymentFormView(viewModel: .fake)
                    ProductsListView(viewModels: [.fake, .fake])
                    PurchaseSummaryView()
                    TermsAndPrivacyView()
                }
            }
            .background(appearanceModel.backgroundColor)
            stickyBottomComponent
        }
    }
    
    private var stickyBottomComponent: some View {
        WideButtonView(title: Constants.finishPurchase, backgroundColor: Color(red: 225/255, green: 0, blue: 152/255))
    }
    
    public init(appearanceModel: AppearanceModel = AppearanceModel()) {
        self.appearanceModel = appearanceModel
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutMainView()
    }
}

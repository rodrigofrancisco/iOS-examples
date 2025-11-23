//
//  CheckoutProductView.swift
//  GEC
//
//  Created by Rodrigo Francisco on 25/11/23.
//

import SwiftUI
import DesignSystem

public struct CheckoutProductViewModel {
    public let estimatedDeliveryViewModel: ProductEstimatedDeliveryViewModel
    public let productInformationViewModel: ProductInformationViewModel
    public let promotionSelectorViewModel: PromotionSelectorViewModel
}

struct CheckoutProductView: View {
    
    private let viewModel: CheckoutProductViewModel
    
    private var productViewModel: ProductInformationView.Dependencies {
        ProductInformationView.Dependencies(viewModel: viewModel.productInformationViewModel)
    }
    
    var body: some View {
            VStack(alignment: .leading, spacing: 15) {
                ProductEstimatedDeliveryView(viewModel: viewModel.estimatedDeliveryViewModel)
                ProductInformationView(dependencies: productViewModel)
                PromotionSelectorView(viewModel: viewModel.promotionSelectorViewModel)
            }
            .padding()
            .cardStyle(backgroundColor: .white)
            .padding(.all, 10)
    }
    
    init(viewModel: CheckoutProductViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    CheckoutProductView(viewModel: .fake)
}

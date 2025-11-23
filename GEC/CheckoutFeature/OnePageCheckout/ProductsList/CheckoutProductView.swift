//
//  CheckoutProductView.swift
//  GEC
//
//  Created by Rodrigo Francisco on 25/11/23.
//

import SwiftUI

struct CheckoutProductViewModel {
    let estimatedDeliveryViewModel: ProductEstimatedDeliveryViewModel
    let productInformationViewModel: ProductInformationViewModel
    let promotionSelectorViewModel: PromotionSelectorViewModel
    
    static let fake = CheckoutProductViewModel(estimatedDeliveryViewModel: .fake, productInformationViewModel: .fake, promotionSelectorViewModel: .fake)
}

struct CheckoutProductView: View {
    
    private let viewModel: CheckoutProductViewModel
    
    var body: some View {
            VStack(alignment: .leading, spacing: 15) {
                ProductEstimatedDeliveryView(viewModel: .fake)
                ProductInformationView(viewModel: .fake)
                PromotionSelectorView(viewModel: .fake)
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

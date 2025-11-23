//
//  ProductEstimatedDeliveryView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 29/11/23.
//

import SwiftUI

struct ProductEstimatedDeliveryViewModel {
    let deliverDate: String
    
    static let fake = ProductEstimatedDeliveryViewModel(deliverDate: "18 noviembre de 2023")
}

struct ProductEstimatedDeliveryView: View {
    private enum Constants {
        static let estimatedDeliveryText = "Entrega estimada:"
    }
    
    private let viewModel: ProductEstimatedDeliveryViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(Constants.estimatedDeliveryText)
                Text(viewModel.deliverDate)
                Spacer()
            }
            Divider()
        }
    }
    
    init(viewModel: ProductEstimatedDeliveryViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    ProductEstimatedDeliveryView(viewModel: .fake)
}

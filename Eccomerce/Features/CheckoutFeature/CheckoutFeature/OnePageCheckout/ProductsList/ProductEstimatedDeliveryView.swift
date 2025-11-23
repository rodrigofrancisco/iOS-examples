//
//  ProductEstimatedDeliveryView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 29/11/23.
//

import SwiftUI

public struct ProductEstimatedDeliveryViewModel {
    public let deliverDate: String
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

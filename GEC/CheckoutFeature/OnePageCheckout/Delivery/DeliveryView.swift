//
//  DeliveryView.swift
//  GEC
//
//  Created by RODRIGO FRANCISCO PABLO on 11/11/23.
//

import SwiftUI

struct DeliveryView: View {
    private struct Constants {
        static let titleView = "1.- Entrega"
        static let changeDelivery = "Cambiar"
    }
    
    private let viewModel: DeliveryViewModel
    
    var body: some View {
        CheckoutItemView(titleItem: Constants.titleView) {
            HStack {
                Text(viewModel.deliveryTitle)
                    .bold()
                Text(Constants.changeDelivery)
                    .underline()
                Spacer()
            }.padding(.bottom, -20)
            Text(viewModel.deliveryPlace)
        }
    }
    
    init(viewModel: DeliveryViewModel) {
        self.viewModel = viewModel
    }
}

struct DeliveryView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryView(viewModel: .fake)
    }
}

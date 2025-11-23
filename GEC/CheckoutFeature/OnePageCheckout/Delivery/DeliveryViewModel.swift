//
//  DeliveryViewModel.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 29/11/23.
//

//enum DeliverType: String {
//    case clickAndCollect
//    case delivery
//}

struct DeliveryViewModel {
    let deliveryTitle: String
    let deliveryPlace: String
    
    static let fake = DeliveryViewModel(deliveryTitle: "Click & Collect", deliveryPlace: "Liverpool Santa Fe")
}

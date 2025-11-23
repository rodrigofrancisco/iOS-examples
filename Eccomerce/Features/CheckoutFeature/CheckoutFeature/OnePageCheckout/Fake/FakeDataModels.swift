//
//  FakeDataModels.swift
//  CheckoutFeature
//
//  Created by RODRIGO FRANCISCO PABLO on 10/04/24.
//

import DesignSystem

public extension DeliveryViewModel {
    static let fake = DeliveryViewModel(deliveryTitle: "Click & Collect", deliveryPlace: "Liverpool Santa Fe")
}

public extension CheckoutProductViewModel {
    static let fake = CheckoutProductViewModel(estimatedDeliveryViewModel: .fake, productInformationViewModel: .fake, promotionSelectorViewModel: .fake)
}

public extension CheckoutMainViewModel {
    static let fake = CheckoutMainViewModel(checkoutTitle: "Liverpool Pocket",
                                            deliveryViewModel: DeliveryViewModel.fake,
                                            paymentViewModel: DesignSystem.PaymentFormViewModel.fake,
                                            productsViewModel: [CheckoutProductViewModel.fake, CheckoutProductViewModel.fake], 
                                            purchaseDetailSummaryViewModel: .fake)
}

public extension ProductEstimatedDeliveryViewModel {
    static let fake = ProductEstimatedDeliveryViewModel(deliverDate: "18 noviembre de 2023")
}

public extension PromotionSelectorViewModel {
    static let fake = PromotionSelectorViewModel(promotionDescription: "3 meses sin intereses")
}

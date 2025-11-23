//
//  CheckoutMainViewModel.swift
//  CheckoutFeature
//
//  Created by RODRIGO FRANCISCO PABLO on 10/04/24.
//

import DesignSystem

public struct CheckoutMainViewModel {
    let checkoutTitle: String
    let deliveryViewModel: DeliveryViewModel
    let paymentViewModel: PaymentFormViewModel
    let productsViewModel: [CheckoutProductViewModel]
    let purchaseDetailSummaryViewModel: PurchaseSummaryDetailViewModel
    
    public init(checkoutTitle: String,
                deliveryViewModel: DeliveryViewModel,
                paymentViewModel: PaymentFormViewModel,
                productsViewModel: [CheckoutProductViewModel],
                purchaseDetailSummaryViewModel: PurchaseSummaryDetailViewModel) {
        self.checkoutTitle = checkoutTitle
        self.deliveryViewModel = deliveryViewModel
        self.paymentViewModel = paymentViewModel
        self.productsViewModel = productsViewModel
        self.purchaseDetailSummaryViewModel = purchaseDetailSummaryViewModel
    }
}

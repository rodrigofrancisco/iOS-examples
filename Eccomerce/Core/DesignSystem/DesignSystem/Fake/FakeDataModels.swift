//
//  FakeDataModels.swift
//  CoreBaseUI
//
//  Created by RODRIGO FRANCISCO PABLO on 10/04/24.
//

public extension PaymentFormViewModel {
    static let fake = PaymentFormViewModel(cardName: "Citi", lastCardDigits: "*5066")
}

public extension ProductInformationViewModel {
    static let fake = ProductInformationViewModel(productTitle: "Abrigo Gianfranco Dunna con bolsillos para hombre",
                                                         productListPrice: "$1,899.00",
                                                         productFinalPrice: "$1,899.00",
                                                         productQuantity: "1",
                                                         productDescriptors: [
                                                            "Cantidad": "1",
                                                            "Talla": "G",
                                                            "Color": "Gris",
                                                            "Material": "Poliéster"
                                                        ])
}

public extension PurchaseSummaryDetailViewModel {
    static let fake = PurchaseSummaryDetailViewModel(numberOfProducts: 2,
                                                     subtotalAmount: "$9,999.00",
                                                     discountAmount: "$0.00",
                                                     couponsAmount: "$0.00",
                                                     shippingCostAmount: "Gratis",
                                                     totalAmount: "$1,999.00")
}

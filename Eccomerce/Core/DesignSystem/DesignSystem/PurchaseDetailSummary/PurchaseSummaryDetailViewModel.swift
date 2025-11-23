//
//  PurchaseSummaryDetailViewModel.swift
//  CoreBaseUI
//
//  Created by RODRIGO FRANCISCO PABLO on 25/04/24.
//

public struct PurchaseSummaryDetailViewModel {
    private let numberOfProducts: Int
    let subtotalAmount: String
    let discountAmount: String
    let couponsAmount: String
    let shippingCostAmount: String
    public let totalAmount: String
    
    public init(numberOfProducts: Int, subtotalAmount: String, discountAmount: String, couponsAmount: String, shippingCostAmount: String, totalAmount: String) {
        self.numberOfProducts = numberOfProducts
        self.subtotalAmount = subtotalAmount
        self.discountAmount = discountAmount
        self.couponsAmount = couponsAmount
        self.shippingCostAmount = shippingCostAmount
        self.totalAmount = totalAmount
    }
    
    var numberOfProductsFormated: String {
        return numberOfProducts > 1 ? "\(numberOfProducts) productos" : "1 producto"
    }
}

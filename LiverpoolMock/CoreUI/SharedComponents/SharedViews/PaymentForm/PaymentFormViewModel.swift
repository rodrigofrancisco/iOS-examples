//
//  PaymentFormViewModel.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 29/11/23.
//

public struct PaymentFormViewModel {
    public let cardName: String
    public let lastCardDigits: String
    
    public static let fake = PaymentFormViewModel(cardName: "Citi", lastCardDigits: "*5066")
}

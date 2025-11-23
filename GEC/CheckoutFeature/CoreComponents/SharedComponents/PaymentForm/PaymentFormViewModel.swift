//
//  PaymentFormViewModel.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 29/11/23.
//

struct PaymentFormViewModel {
    let cardName: String
    let lastCardDigits: String
    
    static let fake = PaymentFormViewModel(cardName: "Citi", lastCardDigits: "*5066")
}

//
//  ProductInformationViewModel.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 29/11/23.
//

struct ProductInformationViewModel {
    let productTitle: String
    let productInformationDescription: String
    let productListPrice: String
    let productFinalPrice: String
    let productQuantity: String
    
    static let fake = ProductInformationViewModel(productTitle: "Abrigo Gianfranco Dunna con bolsillos para hombre", productInformationDescription: "Cantidad: 1, Talla: G, Color: Gris, Material: Poliéster", productListPrice: "$1,899.00", productFinalPrice: "$1,899.00", productQuantity: "1")
}

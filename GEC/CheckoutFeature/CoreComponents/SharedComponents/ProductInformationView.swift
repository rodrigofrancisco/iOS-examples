//
//  ProductInformationView.swift
//  GEC
//
//  Created by Rodrigo Francisco on 26/11/23.
//

import SwiftUI

struct ProductInformationView: View {
    private enum Constants {
        static let minusImageName = "trash"
        static let plusImageName = "trash"
    }
    
    @State private var quantity: String = ""
    
    private let viewModel: ProductInformationViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            productImage
            productInformation
            ThreeDotOptionButton()
        }
    }
    
    private var productImage: some View {
        Image(systemName: "pencil")
            .frame(width: 100, height: 150)
            .background(.yellow)
    }
    
    private var productInformation: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(viewModel.productTitle)
            Text(viewModel.productInformationDescription)
            Text(viewModel.productFinalPrice)
            quantityModifier
        }.fixedSize(horizontal: false, vertical: true) // This prevents truncating text inside vstack
    }
    
    private var quantityModifier: some View {
        HStack(alignment: .center) {
            Image(systemName: Constants.minusImageName)
            TextField(viewModel.productQuantity, text: $quantity)
                .background(.gray)
            Image(systemName: Constants.plusImageName)
        }
    }
    
    init(viewModel: ProductInformationViewModel) {
        self.viewModel = viewModel
    }
}

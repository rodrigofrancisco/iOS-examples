//
//  ProductInformationView.swift
//  GEC
//
//  Created by Rodrigo Francisco on 26/11/23.
//

import SwiftUI

public struct ProductInformationView: View {
    enum Constants {
        static let noProductImage = "no-product-image"
        static let minusImageName = "trash.square"
        static let plusImageName = "plus.app"
    }
    
    @State private var quantity: String = ""
    private let dependencies: Dependencies
    
    public var body: some View {
        HStack(alignment: .top) {
            productImage
            productInformation
            ThreeDotOptionButton()
        }
    }
    
    private var productImage: some View {
        dependencies.viewModel.productImage
            .frame(width: 100, height: 150)
    }
    
    private var productInformation: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(dependencies.viewModel.productTitle)
                .fontWeight(.semibold)
                .foregroundStyle(dependencies.appereance.primaryCarbon)
            Text(dependencies.viewModel.productInformationDescription(apperance: dependencies.appereance))
            
            priceComponent
            quantityModifier
        }
        .fixedSize(horizontal: false, vertical: true) // This prevents truncating text inside vstack
    }
    
    private var priceComponent: some View {
        HStack {
            Text(dependencies.viewModel.productListPrice)
                .strikethrough()
                .foregroundStyle(dependencies.appereance.primaryLead)
                .fontWeight(.semibold)
            Text(dependencies.viewModel.productFinalPrice)
                .fontWeight(.semibold)
                .foregroundStyle(dependencies.appereance.primaryRed)
        }
    }
    
    private var quantityModifier: some View {
        HStack(alignment: .center) {
            Image(systemName: Constants.minusImageName)
            TextField(dependencies.viewModel.productQuantity, text: $quantity)
                .textFieldStyle(.roundedBorder)
                .frame(maxWidth: 60)
                .multilineTextAlignment(.center)
            Image(systemName: Constants.plusImageName)
        }
    }
    
    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

#Preview {
    ProductInformationView(dependencies: ProductInformationView.Dependencies())
}

//
//  ProductInformationViewModel.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 29/11/23.
//

import SwiftUI

extension ProductInformationView {
    public struct Dependencies {
        let viewModel: ProductInformationViewModel
        let appereance: AppearanceModel
        
        public init(viewModel: ProductInformationViewModel, appereance: AppearanceModel = AppearanceModel()) {
            self.viewModel = viewModel
            self.appereance = appereance
        }
    }
    
    public struct AppearanceModel {
        let primaryCarbon: Color
        let primaryLead: Color
        let primaryRed: Color
        
        public init(primaryCarbon: Color,
                    primaryLead: Color,
                    primaryRed: Color) {
            self.primaryCarbon = primaryCarbon
            self.primaryLead = primaryLead
            self.primaryRed = primaryRed
        }
        
        // TODO: Remove this once the dependencies are injected properly
        public init() {
            self.init(
                primaryCarbon: Color(red: 51/255, green: 51/255, blue: 51/255),
                primaryLead: Color(red: 102/255, green: 102/255, blue: 102/255),
                primaryRed: Color(red: 255/255, green: 0, blue: 0))
        }
    }
}

public struct ProductInformationViewModel {
    let productTitle: String
    let productListPrice: String
    let productFinalPrice: String
    let productQuantity: String
    
    let productDescriptors: [String: String]
    
    var productImage: Image {
        Image(ProductInformationView.Constants.noProductImage, bundle: .sharedComponentsBundle)
    }
    
    public init(productTitle: String, productListPrice: String, productFinalPrice: String, productQuantity: String, productDescriptors: [String : String]) {
        self.productTitle = productTitle
        self.productListPrice = productListPrice
        self.productFinalPrice = productFinalPrice
        self.productQuantity = productQuantity
        self.productDescriptors = productDescriptors
    }
    
    func productInformationDescription(apperance: ProductInformationView.AppearanceModel) -> AttributedString {
        let productDescriptionFormated = productDescriptors.map { (descriptor, value) in
            var attributedDescription = AttributedString(descriptor)
            attributedDescription.foregroundColor = apperance.primaryCarbon
            
            var attributedValue = makeAttributedTextBold(value)
            attributedValue.foregroundColor = apperance.primaryCarbon
            return attributedDescription + ": " + attributedValue
        }
        
        return joinAttributedStrings(productDescriptionFormated)
    }
    
    private func joinAttributedStrings(_ attributedStrings: [AttributedString], joinedSymbol: String = ",") -> AttributedString {
        var attributedStringJoined = AttributedString()
        for (index, description) in attributedStrings.enumerated() {
            let concatenatedString =  index + 1 == attributedStrings.count ? AttributedString("") :  AttributedString("\(joinedSymbol) ")
            attributedStringJoined.append(description + concatenatedString)
        }
        
        return attributedStringJoined
    }
    
    private func makeAttributedTextBold(_ text: String) -> AttributedString {
        return (try? AttributedString(markdown: "**\(text)**")) ?? AttributedString(text)
    }
}

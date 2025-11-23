//
//  AirtimeNavigator.swift
//  AirtimeFeature
//
//  Created by Rodrigo Francisco on 25/12/23.
//

import SwiftUI

final class AirtimeNavigator: ObservableObject {
    
    public enum Destination: Hashable {
        case checkout(viewModel: AirtimeCheckoutViewModel)
        
        public static func == (lhs: AirtimeNavigator.Destination, rhs: AirtimeNavigator.Destination) -> Bool {
            lhs.hashValue == rhs.hashValue
        }
        
        func hash(into hasher: inout Hasher) {
            switch self {
            case .checkout(let viewModel):
                // TODO: - Review this; we should use a transaction identifier given by the backend
                hasher.combine(viewModel.purchaseSummary.totalAmount)
                hasher.combine(viewModel.purchaseSummary.subTotalAmount)
                hasher.combine(viewModel.purchaseSummary.numberOfPackages)
                hasher.combine(viewModel.dependencies.defaultPaymentForm.cardName)
                hasher.combine(viewModel.dependencies.defaultPaymentForm.lastCardDigits)
            }
        }
    }
    
    @Published var navPath = [Destination]()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
    
    func navigationHandler(destination: AirtimeNavigator.Destination) -> some View {
        switch destination {
        case .checkout(let viewModel):
            AirtimeCheckoutComposerView(viewModel: viewModel)
        }
    }
}

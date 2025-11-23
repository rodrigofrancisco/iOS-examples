//
//  CheckoutComposer.swift
//  CheckoutFeature
//
//  Created by RODRIGO FRANCISCO PABLO on 25/04/24.
//

import SwiftUI

public struct CheckoutComposer {
    private let viewModel: CheckoutMainViewModel
    private let dependencies: CheckoutDependencies
    
    public init(viewModel: CheckoutMainViewModel, dependencies: CheckoutDependencies) {
        self.viewModel = viewModel
        self.dependencies = dependencies
    }
    
    func compose() -> some View {
        CheckoutMainView(viewModel: viewModel, dependencies: dependencies)
    }
}

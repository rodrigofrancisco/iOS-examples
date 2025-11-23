//
//  AirtimeComposer.swift
//  AirtimeFeature
//
//  Created by Rodrigo Francisco on 26/12/23.
//

import SwiftUI

public struct AirtimeComposer {
    private let navigator: AirtimeNavigator
    private let viewModel: PhoneNumbersListViewModel
    private let dependencies: AirtimeDependencies
    
    public init(viewModel: PhoneNumbersListViewModel, dependencies: AirtimeDependencies) {
        self.navigator = AirtimeNavigator()
        self.viewModel = viewModel
        self.dependencies = dependencies
    }
    
    func compose() -> some View {
        AirtimeMainView(viewModel: viewModel, dependencies: dependencies, navigator: navigator)
    }
}

//
//  AirtimeMainView.swift
//  AirtimeFeature
//
//  Created by Rodrigo Francisco on 11/12/23.
//

import SwiftUI
import SharedComponents

struct AirtimeMainView: View {
    enum Constants {
        static let viewTitle = "Tiempo aire"
    }
    
    private let dependencies: AirtimeDependencies
    private let viewModel: PhoneNumbersListViewModel
    @ObservedObject private var navigator: AirtimeNavigator
    
    var body: some View {
        NavigationStack(path: $navigator.navPath) {
            PhoneNumbersListView(viewModel: viewModel)
                .navigationTitle(Constants.viewTitle)
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(
                    for: AirtimeNavigator.Destination.self,
                    destination: navigator.navigationHandler(destination:)
                )
        }
        .environmentObject(navigator)
        .environmentObject(dependencies.theme)
    }
    
    init(viewModel: PhoneNumbersListViewModel, dependencies: AirtimeDependencies, navigator: AirtimeNavigator) {
        self.viewModel = viewModel
        self.dependencies = dependencies
        self.navigator = navigator
        let primaryColor = UIColor(dependencies.theme.primaryColor)
        NavTheme.navigationBarColors(background: primaryColor, titleColor: .white)
    }
}

#Preview {
    AirtimeMainView(viewModel: .fake, dependencies: .init(theme: .default), navigator: AirtimeNavigator())
}

//
//  AirtimeNavigator.swift
//  AirtimeFeature
//
//  Created by Rodrigo Francisco on 25/12/23.
//

import SwiftUI

final class AirtimeNavigator: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case checkout
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
    
    init(navPath: NavigationPath = NavigationPath()) {
        self.navPath = navPath
    }
    
    func navigationHandler(destination : AirtimeNavigator.Destination) -> some View {
        switch destination {
        case .checkout:
            AirtimeCheckoutComposerView()
        }
    }
}

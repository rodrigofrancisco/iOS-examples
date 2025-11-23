//
//  CheckoutCoordinator.swift
//  CheckoutFeature
//
//  Created by RODRIGO FRANCISCO PABLO on 25/04/24.
//

import SwiftUI

public struct CheckoutCoordinator {
    
    private let composer: CheckoutComposer

    public var start: some View {
        composer.compose()
    }
    
    public init(composer: CheckoutComposer) {
        self.composer = composer
    }
}


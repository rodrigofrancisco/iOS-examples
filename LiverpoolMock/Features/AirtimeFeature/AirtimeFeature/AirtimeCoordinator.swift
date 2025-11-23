//
//  AirtimeCoordinator.swift
//  AirtimeFeature
//
//  Created by Rodrigo Francisco on 26/12/23.
//

import SwiftUI

public struct AirtimeCoordinator {
    
    private let composer: AirtimeComposer

    public var start: some View {
        composer.compose()
    }
    
    public init(composer: AirtimeComposer) {
        self.composer = composer
    }
}

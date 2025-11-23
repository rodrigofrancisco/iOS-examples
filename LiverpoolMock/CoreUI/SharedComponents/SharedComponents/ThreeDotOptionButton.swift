//
//  ThreeDotOptionButton.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 01/12/23.
//

import SwiftUI

public struct ThreeDotOptionButton: View {
    private enum Constants {
        static let optionImageName = "ellipsis"
    }
    
    public var body: some View {
        Image(systemName: Constants.optionImageName)
            .rotationEffect(.degrees(90))
            .padding(.top, 15)
    }
    
    public init() {}
}

#Preview {
    ThreeDotOptionButton()
}

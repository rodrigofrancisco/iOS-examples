//
//  UIView+BackButton.swift
//  AirtimeFeature
//
//  Created by RODRIGO FRANCISCO PABLO on 16/01/24.
//

import SwiftUI

extension View {
    func makeBackButton(action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
            }
        }
    }
}

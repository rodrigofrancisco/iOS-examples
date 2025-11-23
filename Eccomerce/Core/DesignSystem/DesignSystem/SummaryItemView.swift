//
//  SummaryItemView.swift
//  SharedComponents
//
//  Created by Rodrigo Francisco on 11/12/23.
//

import SwiftUI

public struct SummaryItemView: View {
    private let concept: String
    private let amount: String
    
    public var body: some View {
        HStack {
            Text(concept)
            Spacer()
            Text(amount)
        }
    }
    
    public init(concept: String, amount: String) {
        self.concept = concept
        self.amount = amount
    }
}

//
//  PromotionSelectorView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 29/11/23.
//

import SwiftUI

struct PromotionSelectorViewModel {
    let promotionDescription: String
    
    static let fake = PromotionSelectorViewModel(promotionDescription: "3 meses sin intereses")
}

struct PromotionSelectorView: View {
    private enum Constants {
        static let pickPromotionText = "*Elige una promoción"
        static let imageName = "chevron.right"
    }
    
    private let viewModel: PromotionSelectorViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(Constants.pickPromotionText)
            HStack {
                Text(viewModel.promotionDescription)
                Spacer()
                Image(systemName: Constants.imageName)
            }
            .padding(15)
            .border(.gray)
        }
    }
    
    init(viewModel: PromotionSelectorViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    PromotionSelectorView(viewModel: .fake)
}

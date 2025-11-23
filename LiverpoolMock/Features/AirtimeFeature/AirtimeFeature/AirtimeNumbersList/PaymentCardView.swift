//
//  PaymentCardView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 01/12/23.
//

import SwiftUI

struct PaymentCardViewModel {
    let cardNickname: String
    let cardLastDigits: String
    let isDefault: Bool
    
    static let fake = PaymentCardViewModel(cardNickname: "MEC Bloqueado", cardLastDigits: "*1231", isDefault: Bool.random())
}

struct PaymentCardView: View {
    private enum Constants {
        static let defaultCardText = "Predeterminada"
    }
    private let viewModel: PaymentCardViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 20) {
                Image(systemName: "circle")
                VStack(spacing: 5) {
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: "heart.fill").foregroundColor(.red)
                        Text(viewModel.cardNickname)
                        Text(viewModel.cardLastDigits)
                        Spacer()
                    }
                    if viewModel.isDefault {
                        defaultCardLabel
                    }
                }
            }
            .padding(.bottom)
            Divider()
        }
        .padding()
    }
    
    var defaultCardLabel: some View {
        Text(Constants.defaultCardText)
            .foregroundStyle(.blue)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    init(viewModel: PaymentCardViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    PaymentCardView(viewModel: .fake)
}

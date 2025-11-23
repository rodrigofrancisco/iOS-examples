//
//  PaymentFormView.swift
//  GEC
//
//  Created by RODRIGO FRANCISCO PABLO on 11/11/23.
//

import SwiftUI

struct PaymentFormView: View {
    private enum Constants {
        static let titleView = "2.- Forma de pago"
        static let expirationDateText = "Fecha de vencimiento"
        static let expirationDatePlaceholder = "MM/AA*"
        static let securityCodeText = "Código de Seguridad"
        static let securityCodePlaceHolder = "CVV*"
        static let changePayment = "Cambiar"
    }
    
    @State private var expirationDate: String = ""
    @State private var securityNumber: String = ""
    
    private let viewModel: PaymentFormViewModel
    
    var body: some View {
        CheckoutItemView(titleItem: Constants.titleView) {
            HStack {
                Image(systemName: "heart.fill").foregroundColor(.red)
                Text(viewModel.cardName).bold()
                Text(viewModel.lastCardDigits)
                Spacer()
                Text(Constants.changePayment).underline()
            }.padding(.bottom, -20)
            HStack {
                VStack(alignment: .leading) {
                    Text(Constants.expirationDateText).font(.caption)
                    TextField(Constants.expirationDatePlaceholder, text: $expirationDate)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                VStack(alignment: .leading) {
                    Text(Constants.securityCodeText)
                        .font(.caption)
                    TextField(Constants.securityCodePlaceHolder, text: $securityNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
        }
    }
    
    init(viewModel: PaymentFormViewModel) {
        self.viewModel = viewModel
    }
}

struct PaymentFormView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentFormView(viewModel: .fake)
    }
}

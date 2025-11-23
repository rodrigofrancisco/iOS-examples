//
//  AirtimeCheckoutPhoneNumberListView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 11/12/23.
//

import SwiftUI
import DesignSystem

struct AirtimePhoneNumberModel {
    let phoneNickname: String
    let phoneNumber: String
    let packageChose: String
    
    init(phoneNickname: String, phoneNumber: String, packageChose: String) {
        self.phoneNickname = phoneNickname
        self.phoneNumber = phoneNumber
        self.packageChose = packageChose
    }
}

struct AirtimeCheckoutPhoneNumberListView: View {
    
    enum Constants {
        static let title = "1. Números a recargar"
        static let edit = "Editar"
    }
    
    private let viewModel: [AirtimePhoneNumberModel]
    private let editHandler: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Constants.title)
                .bold()
                .font(.caption)
                .padding(.all, 10)
            VStack(alignment: .leading) {
                ForEach(ForEachWrapper.wrap(viewModel)) {
                    phoneNumberItem(model: $0.wrappedValue)
                }
            }
            HStack {
                Spacer()
                Button(action: editHandler, label: {
                    Text(Constants.edit)
                        .font(.caption)
                        .underline()
                }).buttonStyle(PlainButtonStyle())
            }
        }
        .padding([.leading, .trailing], 10)
    }
    
    init(viewModel: [AirtimePhoneNumberModel], editHandler: @escaping () -> Void) {
        self.viewModel = viewModel
        self.editHandler = editHandler
    }
    
    private func phoneNumberItem(model: AirtimePhoneNumberModel) -> some View {
        HStack {
            Text("\(model.phoneNickname) - ")
                .bold()
            Text(model.phoneNumber)
            Spacer()
            Text(model.packageChose)
        }
        .padding()
        .cardStyle(backgroundColor: .white)
    }
}

#Preview {
    AirtimeCheckoutPhoneNumberListView(viewModel: [.fake, .fake, .fake], editHandler: {})
}

//
//  PhoneNumberInfoView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 01/12/23.
//

import SwiftUI

struct PhoneNumberInfoViewModel {
    let nickNamePhone: String
    let phoneNumber: String
    let carrier: String
    
    static let fake = PhoneNumberInfoViewModel(nickNamePhone: "Mi numero", phoneNumber: "(55) 572324234", carrier: "Unefon")
}

struct PhoneNumberInfoView: View {
    private let viewModel: PhoneNumberInfoViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 20) {
                Image(systemName: "square")
                    .frame(width: 30, height: 30)
                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.nickNamePhone)
                    Text(viewModel.phoneNumber)
                    Text(viewModel.carrier)
                        .fontWeight(.thin)
                }
                Spacer()
                ThreeDotOptionButton()
            }
            .padding()
            Divider()
        }
    }
    
    init(viewModel: PhoneNumberInfoViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    PhoneNumberInfoView(viewModel: .fake)
}

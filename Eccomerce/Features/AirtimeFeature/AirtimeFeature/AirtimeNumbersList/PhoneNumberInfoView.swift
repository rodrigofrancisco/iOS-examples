//
//  PhoneNumberInfoView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 01/12/23.
//

import SwiftUI
import DesignSystem

public final class PhoneNumberInfoViewModel: ObservableObject {
    public let nickNamePhone: String
    public let phoneNumber: String
    public let carrier: String
    
    var isSelected: Bool = false
    
    public init(nickNamePhone: String, phoneNumber: String, carrier: String) {
        self.nickNamePhone = nickNamePhone
        self.phoneNumber = phoneNumber
        self.carrier = carrier
    }
}

struct PhoneNumberInfoView: View {
    @ObservedObject private var viewModel: PhoneNumberInfoViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 20) {
                CheckboxView(isChecked: viewModel.isSelected, callback: setCheckboxState)
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
    
    private func setCheckboxState(state: Bool) {
        viewModel.isSelected = state
    }
}

#Preview {
    PhoneNumberInfoView(viewModel: .fake)
}

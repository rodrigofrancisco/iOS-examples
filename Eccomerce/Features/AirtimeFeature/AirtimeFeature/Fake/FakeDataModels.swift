//
//  FakeDataModels.swift
//  AirtimeFeature
//
//  Created by RODRIGO FRANCISCO PABLO on 12/01/24.
//

extension PhoneNumbersListViewModel {
    static let fake = PhoneNumbersListViewModel(phoneNumbersInfo: [.fake, .fake])
}

extension PhoneNumberInfoViewModel {
    static let fake = PhoneNumberInfoViewModel(nickNamePhone: "Mi numero", phoneNumber: "(55) 572324234", carrier: "Unefon")
}

extension PaymentCardViewModel {
    static let fake = PaymentCardViewModel(cardNickname: "MEC Bloqueado", cardLastDigits: "*1231", isDefault: Bool.random())
}

extension AirtimePhoneNumberModel {
    static let fake = AirtimePhoneNumberModel(phoneNickname: "Rodrigo", phoneNumber: "5577299882", packageChose: "Telcel 30 Pesos")
}

extension AirtimePurchaseSummaryViewModel {
    static let fake = AirtimePurchaseSummaryViewModel(numberOfPackages: "1 recarga", subTotalAmount: "$30.00", totalAmount: "$30.00")
}

extension AirtimeCheckoutViewModel {
    static let fake = AirtimeCheckoutViewModel(dependencies: Dependencies(selectedPhoneNumbers: [AirtimePhoneNumberModel.fake, AirtimePhoneNumberModel.fake], defaultPaymentForm: .fake))
}

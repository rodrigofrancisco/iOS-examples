//
//  PhoneNumbersListViewModel.swift
//  AirtimeFeature
//
//  Created by Rodrigo Francisco on 25/12/23.
//

public struct PhoneNumbersListViewModel {
    public let phoneNumbersInfo: [PhoneNumberInfoViewModel]
    
    static let fake = PhoneNumbersListViewModel(phoneNumbersInfo: [.fake, .fake])
    
    public init(phoneNumbersInfo: [PhoneNumberInfoViewModel]) {
        self.phoneNumbersInfo = phoneNumbersInfo
    }
}

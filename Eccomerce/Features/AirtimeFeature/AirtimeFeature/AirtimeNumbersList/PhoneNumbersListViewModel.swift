//
//  PhoneNumbersListViewModel.swift
//  AirtimeFeature
//
//  Created by Rodrigo Francisco on 25/12/23.
//

import SwiftUI
import Combine
import DesignSystem

public class PhoneNumbersListViewModel: ObservableObject {
    @Published public var phoneNumbersInfo: [PhoneNumberInfoViewModel]
    
    enum PhoneNumberError: Error, LocalizedError {
        case notNumberSelected
        
        var errorDescription: String? {
            switch self {
            case .notNumberSelected:
                return NSLocalizedString("Se necesita por lo menos un número telefónico", comment: "Selecciona un número telefónico")
            }
        }
    }
    
    public init(phoneNumbersInfo: [PhoneNumberInfoViewModel]) {
        self.phoneNumbersInfo = phoneNumbersInfo
    }
    
    func handleContinueAction() -> Swift.Result<Void, Error> {
        if phoneNumbersInfo.contains(where: { $0.isSelected }) {
            return .success
        } else {
            return .failure(PhoneNumberError.notNumberSelected)
        }
    }
}

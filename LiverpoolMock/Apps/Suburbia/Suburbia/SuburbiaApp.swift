//
//  SuburbiaApp.swift
//  Suburbia
//
//  Created by Rodrigo Francisco on 11/12/23.
//

import SwiftUI
import AirtimeFeature

extension Color {
    static let primary500 = Color(red: 85/255, green: 33/255, blue: 102/255)
    static let backgroundColor = Color(red: 0.84, green: 0.84, blue: 0.84,opacity: 0.2)
}

@main
struct SuburbiaApp: App {
    private var airtimeCoordinator: AirtimeCoordinator = {
        let phoneNumbers = [
            PhoneNumberInfoViewModel(nickNamePhone: "Mi numero", phoneNumber: "(55) 572324234", carrier: "Unefon"),
            PhoneNumberInfoViewModel(nickNamePhone: "Tu numero", phoneNumber: "(55) 573258345", carrier: "Telcel")
        ]
        let viewModel = PhoneNumbersListViewModel(phoneNumbersInfo: phoneNumbers)
        let dependencies = AirtimeDependencies(theme: Theme(primaryColor: Color.primary500, backgroundColor: Color.backgroundColor))
        return AirtimeCoordinator(composer: AirtimeComposer(viewModel: viewModel, dependencies: dependencies))
    }()
    
    
    var body: some Scene {
        WindowGroup {
            airtimeCoordinator.start
        }
    }
}

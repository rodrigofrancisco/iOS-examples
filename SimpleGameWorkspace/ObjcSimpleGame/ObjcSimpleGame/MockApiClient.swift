//
//  MockApiClient.swift
//  ObjcSimpleGame
//
//  Created by RODRIGO FRANCISCO PABLO on 18/11/24.
//

import Foundation

class MockApiClient: NSObject {
    override init() {
        print("Initializer called in Mock API Client")
    }
    
    @objc
    func executeRequest(with endpoint: MockLoginEndpoint) {
        print("The execute request has bee called in the mock api client")
        
        print(endpoint.endpoint)
        print(endpoint.parameters ?? [:])
        
        endpoint.getCount("and ulr") { result in
            print("This is the result: \(result) in fact in an 32 bit integer")
        }
    }
}

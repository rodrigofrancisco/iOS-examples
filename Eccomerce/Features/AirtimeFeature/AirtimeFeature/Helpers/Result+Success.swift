//
//  Result+Success.swift
//  AirtimeFeature
//
//  Created by RODRIGO FRANCISCO PABLO on 10/01/24.
//

import Foundation

public extension Result where Success == Void {
    
    /// A success, storing a Success value.
    ///
    /// Instead of `.success(())`, now  `.success`
    static var success: Result {
        return .success(())
    }
}

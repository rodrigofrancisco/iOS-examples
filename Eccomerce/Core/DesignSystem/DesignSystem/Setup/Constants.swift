//
//  Constants.swift
//  SharedComponents
//
//  Created by Rodrigo Francisco on 24/12/23.
//

import Foundation

struct Constants {
    static let bundleIdentifier = "mx.liverpool.CoreBaseUI"
}

extension Bundle {
    static let sharedComponentsBundle = Bundle(identifier: Constants.bundleIdentifier)
}

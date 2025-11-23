//
//  Constants.swift
//  SharedComponents
//
//  Created by Rodrigo Francisco on 24/12/23.
//

struct Constants {
    static let bundleIdentifier = "com.roverty.SharedComponents"
}

extension Bundle {
    static let sharedComponentsBundle = Bundle(identifier: Constants.bundleIdentifier)
}

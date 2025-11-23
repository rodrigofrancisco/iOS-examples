//
//  ForEachWrapper.swift
//  SharedComponents
//
//  Created by Rodrigo Francisco on 24/12/23.
//

import Foundation

public struct ForEachWrapper<T>: Identifiable {
    public let id = UUID()
    public let wrappedValue: T
    
    public init(viewModel: T) {
        self.wrappedValue = viewModel
    }
    
    public static func wrap(_ viewModels: [T]) -> [ForEachWrapper<T>] {
        return viewModels.map { ForEachWrapper(viewModel: $0) }
    }
}

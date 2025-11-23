//
//  ForEachWrapper.swift
//  SharedComponents
//
//  Created by Rodrigo Francisco on 24/12/23.
//

public struct ForEachWrapper<T>: Identifiable {
    public let id = UUID()
    public let viewModel: T
    
    public init(viewModel: T) {
        self.viewModel = viewModel
    }
    
    public static func wrap(_ viewModels: [T]) -> [ForEachWrapper<T>] {
        return viewModels.map { ForEachWrapper(viewModel: $0) }
    }
}

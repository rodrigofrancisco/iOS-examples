//
//  ProductsView.swift
//  GEC
//
//  Created by RODRIGO FRANCISCO PABLO on 13/11/23.
//

import SwiftUI

struct ProductsListView: View {
    
    private enum Constants {
        static let titleView = "3. Artículos"
    }
    
    private struct ForEachWrapper<T>: Identifiable {
        let id = UUID()
        let viewModel: T
        
        init(viewModel: T) {
            self.viewModel = viewModel
        }
        
        static func wrap(_ viewModels: [T]) -> [ForEachWrapper<T>] {
            return viewModels.map { ForEachWrapper(viewModel: $0) }
        }
    }
    
    private let viewModels: [CheckoutProductViewModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Constants.titleView)
                .bold()
                .padding(.all, 10)
            ForEach(ForEachWrapper.wrap(viewModels), id: \.id) {
                CheckoutProductView(viewModel: $0.viewModel)
                    .padding(.bottom, 20)
            }
        }
    }
    
    init(viewModels: [CheckoutProductViewModel]) {
        self.viewModels = viewModels
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView(viewModels: [.fake, .fake])
    }
}

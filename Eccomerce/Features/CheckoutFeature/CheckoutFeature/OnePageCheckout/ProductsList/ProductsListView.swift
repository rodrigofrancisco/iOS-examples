//
//  ProductsView.swift
//  GEC
//
//  Created by RODRIGO FRANCISCO PABLO on 13/11/23.
//

import SwiftUI
import DesignSystem

struct ProductsListView: View {
    
    private enum Constants {
        static let titleView = "3. Artículos"
    }

    private let viewModels: [CheckoutProductViewModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Constants.titleView)
                .font(.caption)
                .bold()
                .padding([.leading, .trailing, .top], 10)
            ForEach(ForEachWrapper.wrap(viewModels), id: \.id) {
                CheckoutProductView(viewModel: $0.wrappedValue)
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

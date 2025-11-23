//
//  ProductListPageView.swift
//  PLPFeature
//
//  Created by RODRIGO FRANCISCO PABLO on 08/10/24.
//

import SwiftUI

struct ProductListPageView: View {
    private let viewModels: [GridItemViewModel]
        
    private let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 2, alignment: .top), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: self.columns) {
                ForEach(viewModels, id: \.productName) { item in
                    GridItemView(viewModel: item)
                }
            }.padding(.horizontal, 8)
        }
    }
    
    init(viewModels: [GridItemViewModel]) {
        self.viewModels = viewModels
    }
}

#Preview {
    ProductListPageView(viewModels: dataComingFromMappers)
}

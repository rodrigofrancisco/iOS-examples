//
//  ContentView.swift
//  PLPFeature
//
//  Created by RODRIGO FRANCISCO PABLO on 08/10/24.
//

import SwiftUI

struct GridItemViewModel {
    struct Rating {
        let score: Float
        let ratingCount: Int
    }
    
    struct Price {
        let listingPrice: String
        let promoPrice: String?
    }
    
    let productName: String
    let productImageUrl: URL?
    let productColors: [Color]
    let prices: Price
    let rating: Rating?
}

struct GridItemView: View {
    private let viewModel: GridItemViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AsyncImage(url: viewModel.productImageUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            } placeholder: {
                ProgressView()
            }
            Text(viewModel.productName)
            pricesView
            colorsView
            HStack {
                if let rating = viewModel.rating {
                    ratingView
                    Text("(\(rating.ratingCount))")
                }
            }
        }
        .padding()
    }
    
    private var pricesView: some View {
        Group {
            if let promoPrice = viewModel.prices.promoPrice {
                Text(promoPrice).strikethrough()
                Text(viewModel.prices.listingPrice)
            } else {
                Text(viewModel.prices.listingPrice)
            }
        }
    }
    
    private var colorsView: some View {
        HStack {
            ForEach(viewModel.productColors, id: \.self) { color in
                Circle()
                    .foregroundStyle(color)
                    .frame(width: 20)
                    .overlay(Circle().strokeBorder(Color.white, lineWidth: 2.0))
                    .padding(1.0)
                    .overlay(Circle().strokeBorder(Color.gray, lineWidth: 1.0))
            }
        }
    }
    
    private var ratingView: some View {
        let size: CGFloat = 8
        return HStack {
            Image(systemName: "star").frame(width: size)
            Image(systemName: "star").frame(width: size)
            Image(systemName: "star").frame(width: size)
            Image(systemName: "star").frame(width: size)
            Image(systemName: "star").frame(width: size)
        }
    }
    
    init(viewModel: GridItemViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    let viewModel =  GridItemViewModel(
        productName: "Gap - Playera cuello redondo para hombre",
        productImageUrl: URL(string: "https://ss223.liverpool.com.mx/xl/1151133521.jpg"),
        productColors: [
            Color.red, Color.green, Color.black, Color.gray, Color.yellow
        ],
        prices: GridItemViewModel.Price(
            listingPrice: "$379.00 - $499.00",
            promoPrice: "$284.25 - 374.25"
        ),
        rating: GridItemViewModel.Rating(score: 4, ratingCount: 105)
    )
    return GridItemView(viewModel: viewModel)
}

#Preview {
    let viewModel =  GridItemViewModel(
        productName: "Gap - Playera cuello redondo para hombre",
        productImageUrl: URL(string: "https://ss223.liverpool.com.mx/xl/1151133521.jpg"),
        productColors: [
            Color.green, Color.blue
        ],
        prices: GridItemViewModel.Price(
            listingPrice: "$379.00 - $499.00",
            promoPrice: nil
        ),
        rating: GridItemViewModel.Rating(score: 4, ratingCount: 10)
    )
    return GridItemView(viewModel: viewModel)
}

#Preview {
    let viewModel =  GridItemViewModel(
        productName: "Gap - Playera cuello redondo para hombre",
        productImageUrl: URL(string: "https://ss223.liverpool.com.mx/xl/1151133521.jpg"),
        productColors: [
            Color.red
        ],
        prices: GridItemViewModel.Price(
            listingPrice: "$379.00 - $499.00",
            promoPrice: nil
        ),
        rating: nil
    )
    return GridItemView(viewModel: viewModel)
}

#Preview {
    let viewModel =  GridItemViewModel(
        productName: "Gap - Playera cuello redondo para hombre",
        productImageUrl: URL(string: "https://ss223.liverpool.com.mx/xl/1151133521.jpg"),
        productColors: [
            Color.red
        ],
        prices: GridItemViewModel.Price(
            listingPrice: "$379.00 - $499.00",
            promoPrice: "$379.00 - $499.00"
        ),
        rating: nil
    )
    return GridItemView(viewModel: viewModel)
}

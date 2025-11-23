//
//  PLPFeatureApp.swift
//  PLPFeature
//
//  Created by RODRIGO FRANCISCO PABLO on 18/11/24.
//

import SwiftUI

let dataComingFromMappers = [
    GridItemViewModel(
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
    ),
    GridItemViewModel(
        productName: "Gapi - Playera cuello redondo para hombre",
        productImageUrl: URL(string: "https://ss223.liverpool.com.mx/xl/1151133521.jpg"),
        productColors: [
            Color.red, Color.green, Color.black, Color.gray
        ],
        prices: GridItemViewModel.Price(
            listingPrice: "$379.00 - $499.00",
            promoPrice: nil
        ),
        rating: nil
    ),
    GridItemViewModel(
        productName: "Gap - Camisa cuello redondo para hombre",
        productImageUrl: URL(string: "https://ss223.liverpool.com.mx/xl/1151133521.jpg"),
        productColors: [
            Color.green, Color.blue
        ],
        prices: GridItemViewModel.Price(
            listingPrice: "$379.00 - $499.00",
            promoPrice: nil
        ),
        rating: GridItemViewModel.Rating(score: 4, ratingCount: 10)
    ),
    GridItemViewModel(
        productName: "Gap - Sudadera cuello redondo para hombre",
        productImageUrl: URL(string: "https://ss223.liverpool.com.mx/xl/1151133521.jpg"),
        productColors: [
            Color.red
        ],
        prices: GridItemViewModel.Price(
            listingPrice: "$379.00 - $499.00",
            promoPrice: nil
        ),
        rating: nil
    ),
    GridItemViewModel(
        productName: "Gap - Pantalón cuello redondo para hombre",
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
]


@main
struct PLPFeatureApp: App {
    var body: some Scene {
        WindowGroup {
            ProductListPageView(viewModels: dataComingFromMappers)
        }
    }
}

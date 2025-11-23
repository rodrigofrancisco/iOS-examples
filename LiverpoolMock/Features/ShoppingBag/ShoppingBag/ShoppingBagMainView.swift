//
//  ShoppingBagMainView.swift
//  ShoppingBag
//
//  Created by Rodrigo Francisco on 24/12/23.
//

import SwiftUI
import SharedComponents

struct ShoppingBagMainView: View {
    var body: some View {
        VStack {
            stickyTopComponent
            ScrollView {
                productInformation
                productInformation
                productInformation
                PurchaseDetailSummaryView()
            }
            stickyBottomComponent
        }
    }
    
    var productInformation: some View {
        VStack(alignment: .leading, spacing: 15) {
            ProductInformationView(dependencies: ProductInformationView.Dependencies())
        }
        .padding()
        .cardStyle(backgroundColor: .white)
        .padding(.all, 10)
    }
    
    var stickyTopComponent: some View {
        HStack {
            Image(systemName: "truck.box")
            Text("Envío gratis")
            Spacer()
        }
        .padding()
        .background(Color.white)
    }
    
    var stickyBottomComponent: some View {
        HStack {
            Text("Total (1): $902.30")
            Spacer()
            WideButtonView(title: "Comprar", backgroundColor: Color(red: 225/255, green: 0, blue: 152/255))
        }.padding([.leading, .trailing])
    }
}

#Preview {
    ShoppingBagMainView()
}

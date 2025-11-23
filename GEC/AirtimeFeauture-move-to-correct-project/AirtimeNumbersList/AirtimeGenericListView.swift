//
//  AirtimeNumbersListView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 01/12/23.
//

import SwiftUI

struct AirtimeGenericListView<Component: View>: View {
    private let title: String
    private let actionName: String
    
    private let itemsView: Component
    
    var body: some View {
        VStack {
            ScrollView {
                itemsListView
            }.background(Color.lightGrayBackground)
            stickyBottomView
        }
    }
    
    private var itemsListView: some View {
        VStack(spacing: 0) {
            titleView
            VStack {
                itemsView
                addNewItemView
            }
            .background(Color.white)
        }
        .padding()
    }
    
    private var stickyBottomView: some View {
        WideButtonView(title: "Continuar")
    }
    
    private var titleView: some View {
        Text(title)
            .bold()
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
    }
    
    private var addNewItemView: some View {
        HStack {
            Text(actionName)
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        
    }
    
    init(title: String, actionName: String, itemsView: () -> Component) {
        self.title = title
        self.actionName = actionName
        self.itemsView = itemsView()
    }
}

#Preview {
    AirtimeGenericListView(title: "1. selecciona tus números a recargar", actionName: "Agregar teléfono", itemsView: {
        VStack {
            PhoneNumberInfoView(viewModel: .fake)
            PaymentCardView(viewModel: .fake)
        }
    })
}

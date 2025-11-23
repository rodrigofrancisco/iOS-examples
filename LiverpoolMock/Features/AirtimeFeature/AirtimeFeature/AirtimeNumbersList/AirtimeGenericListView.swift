//
//  AirtimeNumbersListView.swift
//  CheckoutFeature
//
//  Created by Rodrigo Francisco on 01/12/23.
//

import SwiftUI
import SharedComponents

struct AirtimeGenericListView<Component: View>: View {
    private let title: String
    private let actionName: String
    
    private let callback: (() -> ())?
    
    @EnvironmentObject private var theme: Theme
    private let itemsView: Component
    
    var body: some View {
        VStack {
            ScrollView {
                itemsListView
            }.background(theme.backgroundColor)
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
        WideButtonView(title: "Continuar", 
                       backgroundColor: theme.primaryColor,
                       callback: callback)
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
    
    init(title: String, actionName: String, itemsView: () -> Component, callback: (() -> ())? = nil) {
        self.title = title
        self.actionName = actionName
        self.itemsView = itemsView()
        self.callback = callback
    }
}

#Preview {
    AirtimeGenericListView(title: "1. selecciona tus números a recargar", actionName: "Agregar teléfono", itemsView: {
        VStack {
            PhoneNumberInfoView(viewModel: .fake)
            PaymentCardView(viewModel: .fake)
        }
    })
    .environmentObject(Theme.default)
}

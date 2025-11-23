//
//  GenericCardContainer.swift
//  GEC
//
//  Created by Rodrigo Francisco on 25/11/23.
//

import SwiftUI

struct GenericCardContainerView<ComponentView: View>: View {
    
    let component: ComponentView
    
    var body: some View {
        VStack(alignment: .leading) {
            component
                .padding(.all, 20)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .shadow(radius: 10)
        .padding(.all, 10)
    }
    
    init(@ViewBuilder component: () -> ComponentView) {
        self.component = component()
    }
}

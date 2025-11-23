//
//  ContentView.swift
//  ProductListingPage
//
//  Created by Rodrigo Francisco on 07/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .foregroundColor(Color.blue)
                .padding(.vertical, 5.0)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

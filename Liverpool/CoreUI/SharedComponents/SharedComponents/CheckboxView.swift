//
//  CheckboxView.swift
//  SharedComponents
//
//  Created by Rodrigo Francisco on 24/12/23.
//

import SwiftUI

public struct CheckboxView: View {
    
    public typealias CheckboxStateCallback = (Bool) -> ()
    
    @State private var isChecked: Bool
    private let callback: CheckboxStateCallback?
    
    public var body: some View {
        Button(action: {
            isChecked.toggle()
            callback?(isChecked)
        }, label: {
            checkboxImage
        })
    }
    
    private var imageImage: String {
        return isChecked ? "checkmark.square" : "square"
    }
    
    private var checkboxImage: some View {
        Image(systemName: imageImage)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 22, height: 22)
            .foregroundStyle(Color.gray)
            .fontWeight(.thin)
    }
    
    public init(isChecked: Bool = false, callback: CheckboxStateCallback? = nil) {
        self.isChecked = isChecked
        self.callback = callback
    }
}

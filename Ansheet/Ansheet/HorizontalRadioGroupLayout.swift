//
//  HorizontalRadioGroupLayout.swift
//  Ansheet
//
//  Created by RODRIGO FRANCISCO PABLO on 02/03/25.
//

import SwiftUI

struct HorizontalRadioGroupLayout: View {
    @Binding private var selected: String?
    
    private let labelNumber: Int
    private let options: [String]
    
    init(labelNumber: Int, options: [String], selected: Binding<String?>) {
        self.labelNumber = labelNumber
        self.options = options
        self._selected = selected
    }
    
    var labelFormatted: String {
        "\(labelNumber)."
    }
    
    var body: some View {
        HStack {
            labelView
            Picker(labelFormatted, selection: $selected) {
                ForEach(options, id: \.self) { option in
                    Text("\(option)").tag(option)
                }
            }
            .pickerStyle(.segmented)
        }
    }
    
    private var labelView: some View {
        Text(labelFormatted)
            .frame(width: 35, height: 30)
            .background(Color.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

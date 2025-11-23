//
//  TermsAndPrivacyView.swift
//  GEC
//
//  Created by Rodrigo Francisco on 25/11/23.
//

import SwiftUI

struct TermsAndPrivacyView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Text("He leído y acepto Términos, Condiciones y Aviso de Privacidad")
                .multilineTextAlignment(.center)
            HStack {
                Image(systemName: "lock")
                Text("Todas nuestras transacciones son seguras")
                    .multilineTextAlignment(.center)
            }
        }.padding([.leading, .trailing], 30)
    }
}

#Preview {
    TermsAndPrivacyView()
}

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
            Group {
                Text("He leído y acepto [Términos, Condiciones y Aviso de Privacidad](https://assets.liverpool.com.mx/ayuda-app/#/seccion/terminos-condiciones/1)")
            }
            .font(.subheadline)
            .multilineTextAlignment(.center)
            
            HStack {
                Image(systemName: "lock")
                Text("Todas nuestras transacciones son seguras")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
        }.padding([.leading, .trailing], 30)
    }
}

#Preview {
    TermsAndPrivacyView()
}

//
//  AlertNotification.swift
//  SharedComponents
//
//  Created by RODRIGO FRANCISCO PABLO on 09/01/24.
//

import SwiftUI

public struct AlertNotificationModifier: ViewModifier {
    private let alert: AlertNotification?
    private let dismissAction: () -> Void
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            content
            if let alert = alert {
                alert.view(dismissAction: dismissAction)
            }
        }
    }
    
    public init(alert: AlertNotification?, dismissAction: @escaping () -> Void) {
        self.alert = alert
        self.dismissAction = dismissAction
    }
}

public extension View {
    func notificationAlert(alert: AlertNotification?,  dismissAction: @escaping () -> Void) -> some View {
        modifier(AlertNotificationModifier(alert: alert, dismissAction: dismissAction))
    }
}

public enum AlertNotification {
    case error(message: String)
    case warning(message: String)
    case informative(message: String)
    
    public func view(dismissAction: @escaping () -> Void) -> some View {
        switch self {
        case .error(let string):
            AlertNotificationView(alertText: string, 
                                  backgroundColor: .semanticError50,
                                  accentColor: .semanticError500,
                                  textColor: .surface300,
                                  dismissAction: dismissAction)
        case .warning(let string):
            AlertNotificationView(alertText: string, 
                                  backgroundColor: .semanticWarning50,
                                  accentColor: .semanticWarning500,
                                  textColor: .surface300,
                                  dismissAction: dismissAction)
        case .informative(let string):
            AlertNotificationView(alertText: string, 
                                  backgroundColor: .semanticInformative50,
                                  accentColor: .semanticInformative500,
                                  textColor: .semanticInformative500,
                                  dismissAction: dismissAction)
        }
    }
}

fileprivate struct AlertNotificationView: View {
    private let alertText: String
    private let backgroundColor: Color
    private let accentColor: Color
    private let textColor: Color
    
    private let dismissAction: () -> Void
    
    var body: some View {
        mainView
    }
    
    var mainView: some View {
        HStack {
            Text(alertText)
                .foregroundStyle(textColor)
            Spacer()
            Button(action: dismissAction, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(accentColor)
            })
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .background(backgroundColor)
        .overlay(
            Rectangle().fill(accentColor).frame(width: 7), alignment: .leading)
    }
    
    init(alertText: String, backgroundColor: Color, accentColor: Color, textColor: Color, dismissAction: @escaping () -> Void) {
        self.alertText = alertText
        self.backgroundColor = backgroundColor
        self.accentColor = accentColor
        self.textColor = textColor
        self.dismissAction = dismissAction
    }
}

#Preview {
    AlertNotification.error(message: "Debes tener un número de télefono").view(dismissAction: {})
}

#Preview {
    AlertNotification.warning(message: "Este producto no se puede facturar").view(dismissAction: {})
}

#Preview {
    AlertNotification.informative(message: "Este producto no se puede facturar").view(dismissAction: {})
}

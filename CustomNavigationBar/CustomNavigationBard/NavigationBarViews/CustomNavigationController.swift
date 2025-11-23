//
//  CustomNavigationController.swift
//  CustomNavigationBard
//
//  Created by RODRIGO FRANCISCO PABLO on 27/11/24.
//

import UIKit

extension UIColor {
    static let primary500 =  UIColor(red: 225/255, green: 0, blue: 152/255, alpha: 1)
}

extension UINavigationBarAppearance {
    struct Theme {
        let backgroundColor: UIColor
        let titleTextAttributes: [NSAttributedString.Key : Any]
        
        static let primary = Theme(
            backgroundColor: .primary500,
            titleTextAttributes: [.foregroundColor: UIColor.lightText]
        )
    }
    
    convenience init(theme: Theme) {
        self.init()
        self.configureWithOpaqueBackground()
        self.backgroundColor = theme.backgroundColor
        self.titleTextAttributes = theme.titleTextAttributes
    }
}

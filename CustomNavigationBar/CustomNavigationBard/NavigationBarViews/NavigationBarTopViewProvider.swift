//
//  NavigationBarTopViewProvider.swift
//  CustomNavigationBard
//
//  Created by RODRIGO FRANCISCO PABLO on 03/02/25.
//

import UIKit

final class StoreSelectorTopView {
    static var shared = StoreSelectorTopView()
    
    static let addressSelectorView = StoreSelectorView(icon: "location.fill", name: "Pick your address")
    static let storeSelectorView = StoreSelectorView(icon: "storefront", name: "Pick a store")
    
    static let navbarTopView: UIView = {
        let divider = HDivider(width: 1, color: .white)
        let emptySpacer = UIView()
        let innerView = UIStackView(arrangedSubviews: [
            addressSelectorView,
            divider,
            storeSelectorView,
            emptySpacer
        ])
        innerView.translatesAutoresizingMaskIntoConstraints = false
        innerView.axis = .horizontal
        innerView.alignment = .leading
        innerView.distribution = .fill
        
        innerView.setCustomSpacing(10, after: divider)
        
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(innerView)
        
        NSLayoutConstraint.activate([
            innerView.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            innerView.leadingAnchor.constraint(equalTo:  container.leadingAnchor, constant: 10),
            innerView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            innerView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10)
        ])
        
        return container
    }()
    
    private init() {}
}

extension StoreSelectorTopView: TopNavigationRenderable {
    var topView: UIView {
        StoreSelectorTopView.navbarTopView
    }
    
    var additionalSpace: CGFloat { 45 }
}

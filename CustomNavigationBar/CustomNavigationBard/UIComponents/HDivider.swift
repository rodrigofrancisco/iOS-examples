//
//  HDivider.swift
//  CustomNavigationBard
//
//  Created by RODRIGO FRANCISCO PABLO on 26/02/25.
//

import UIKit

final class HDivider: UIView {
    init(width: CGFloat = 1, color: UIColor = .white) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: 15).isActive = true
        self.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

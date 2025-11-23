//
//  ShoppingBagIcon.swift
//  CustomNavigationBard
//
//  Created by RODRIGO FRANCISCO PABLO on 23/12/24.
//

import UIKit

final class ShoppingBagIcon: UIView {
    private let bagIcon: UIButton
    private let bagCountLabel: UILabel
    
    init() {
        self.bagIcon = UIButton(type: .custom)
        self.bagCountLabel = UILabel()
        super.init(frame: .zero)
        
        self.frame.origin = CGPoint(x: 0, y: 0)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.masksToBounds = false
        self.backgroundColor = .clear
        
        bagIcon.frame.origin = CGPoint(x: 0, y: 0)
        bagIcon.translatesAutoresizingMaskIntoConstraints = false
        bagIcon.setImage(UIImage(systemName: "bag"), for: .normal)
        bagIcon.accessibilityIdentifier = "buttonBagHome"
        bagIcon.layer.masksToBounds = false
        
        bagCountLabel.frame = CGRect(x: 10, y: 15, width: 18, height: 18)
        bagCountLabel.layer.backgroundColor = UIColor.clear.cgColor
        bagCountLabel.layer.cornerRadius = 10
        bagCountLabel.layer.masksToBounds = true
        bagCountLabel.backgroundColor = .white
        
        bagCountLabel.accessibilityIdentifier = "labelBadgeCount"
        bagCountLabel.font = .systemFont(ofSize: 10, weight: .regular)
        bagCountLabel.textAlignment = NSTextAlignment.center
        bagCountLabel.text = formatBagCounting(using: 0)
        
        self.addSubview(bagIcon)
        self.addSubview(bagCountLabel)
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 32),
            self.widthAnchor.constraint(equalToConstant: 33),
            bagIcon.leftAnchor.constraint(equalTo: self.leftAnchor),
            bagIcon.topAnchor.constraint(equalTo: self.topAnchor),
            bagIcon.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            bagIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAction(target: Any?, selector: Selector) {
        bagIcon.addTarget(target, action: selector, for: .touchUpInside)
    }
    
    func updateBagCount(with count: Int) {
        bagCountLabel.text = formatBagCounting(using: count)
    }
    
    private func formatBagCounting(using count: Int) -> String {
        return count >= 10 ? "9+" : "\(count)"
    }
}

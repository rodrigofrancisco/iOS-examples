//
//  StoreSelectorView.swift
//  CustomNavigationBard
//
//  Created by RODRIGO FRANCISCO PABLO on 27/11/24.
//

import UIKit

final class StoreSelectorView: UIView {
    init(icon: String, name: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        let storeContainer = UIView()
        storeContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let iconImage = UIImageView(image: UIImage(systemName: icon))
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.tintColor = .white
        let storeName = UILabel()
        storeName.text = name
        storeName.font = UIFont.systemFont(ofSize: 15)
        storeName.textColor = .white
        storeName.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(storeContainer)
        storeContainer.addSubview(iconImage)
        storeContainer.addSubview(storeName)
        
        NSLayoutConstraint.activate([
            storeContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            storeContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            storeContainer.topAnchor.constraint(equalTo: self.topAnchor),
            storeContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            iconImage.leadingAnchor.constraint(equalTo: storeContainer.leadingAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 20),
            iconImage.heightAnchor.constraint(equalToConstant: 20),
            
            storeName.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
            storeName.trailingAnchor.constraint(equalTo: storeContainer.trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

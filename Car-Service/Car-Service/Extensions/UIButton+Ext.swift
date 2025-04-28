//
//  UIButton+Ext.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 28.04.2025.
//

import UIKit

extension UIButton {
    convenience init(title: String, bgColor: UIColor) {
        self.init(type: .system)
        layer.cornerRadius = 12
        backgroundColor = bgColor
        setTitle(title, for: .normal)
        tintColor = .white
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel?.font = .boldSystemFont(ofSize: 26)
    }
}

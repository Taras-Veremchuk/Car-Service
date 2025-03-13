//
//  UITextField+Ext.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 13.03.2025.
//

import UIKit

extension UITextField {
    convenience init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
        font = .italicSystemFont(ofSize: 18)
        borderStyle = .none
        backgroundColor = .white
        let height: CGFloat = 60
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
        layer.borderWidth = 1
        if let placeholderColor = self.value(
            forKeyPath: "placeholderLabel.textColor") as? UIColor
        {
            layer.borderColor = placeholderColor.cgColor
        }
        heightAnchor.constraint(equalToConstant: height).isActive = true
        leftView = UIView(frame: .init(x: 0, y: 0, width: 22, height: 0))
        leftViewMode = .always
    }
}

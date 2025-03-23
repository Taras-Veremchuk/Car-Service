//
//  UILabel+Ext.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 13.03.2025.
//

import UIKit

extension UILabel {
    convenience init(
        title: String = "", textColor: UIColor = .black, fontSize: CGFloat,
        lines: Int = 0, isBold: Bool = false
    ) {
        self.init()
        let coeff: CGFloat = UIScreen.main.bounds.height / 874.0
        let dynamicFontSize: CGFloat = coeff * fontSize
        text = title
        self.textColor = textColor
        font = isBold ? .boldSystemFont(ofSize: dynamicFontSize) : .systemFont(ofSize: dynamicFontSize)
        numberOfLines = lines
    }
}

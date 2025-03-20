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
        let dynamicFontSize = UIScreen.main.bounds.height * (fontSize / 852)
        self.text = title
        self.textColor = textColor
        self.font =
            isBold
            ? .boldSystemFont(ofSize: dynamicFontSize) : .systemFont(ofSize: dynamicFontSize)
        self.numberOfLines = lines
    }
}

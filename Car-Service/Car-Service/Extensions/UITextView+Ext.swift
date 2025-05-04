//
//  UITextView+Ext.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 04.05.2025.
//

import UIKit

extension UITextView {
    convenience init(font: UIFont, textColor: UIColor, maxNumberOfLines: Int = 0) {
        self.init()
        self.font = font
        self.textColor = textColor
        self.borderStyle = .none
        self.textContainer.maximumNumberOfLines = maxNumberOfLines
        self.textContainer.lineFragmentPadding = 0
        self.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.backgroundColor = .bgCell
        self.isScrollEnabled = false
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
    }
}

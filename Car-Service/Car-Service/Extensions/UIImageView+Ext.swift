//
//  UIImageView+Ext.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 13.03.2025.
//

import UIKit

extension UIImageView {
    convenience init(
        customImage: UIImage?, contentMode: UIView.ContentMode,
        cornerRadius: CGFloat = 0
    ) {
        self.init(image: customImage)
        self.contentMode = contentMode
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
    }
}

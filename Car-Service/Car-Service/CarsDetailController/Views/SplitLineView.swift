//
//  SplitLineView.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 20.03.2025.
//

import UIKit

final class SplitLineView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        backgroundColor = UIColor(named: "lineColor")
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
}

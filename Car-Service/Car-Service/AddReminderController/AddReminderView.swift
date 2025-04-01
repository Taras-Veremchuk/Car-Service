//
//  AddReminderView.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 01.04.2025.
//

import UIKit

class AddReminderView: UIView {
    private let textLabel = UILabel(title: "Hello", fontSize: 45)
    
    init() {
        super.init(frame: .zero)
        setViews()
        setConstraints()
    }
    private func setViews() {
        backgroundColor = .appBg
    }
    
    private func setConstraints() {
        addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

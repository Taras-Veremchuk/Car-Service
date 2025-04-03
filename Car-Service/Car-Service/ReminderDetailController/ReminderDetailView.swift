//
//  ReminderDetailView.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 03.04.2025.
//

import UIKit

final class ReminderDetailView: UIView {
    private let textLabel = UILabel(title: "Call to Mechanik", fontSize: 22, isBold: true)
    private let dataLabel = UILabel(title: "Today", fontSize: 16)
    
    
    init() {
        super.init(frame: .zero)
        setViews()
        setConstraints()
    }
    
    private func setViews() {
        backgroundColor = .white
//        textLabel.numberOfLines 
    }
    
    func setupView(_ reminder: Reminders) {
        textLabel.text = reminder.text
        dataLabel.text = reminder.data
    }
    
    private func setConstraints() {
        addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        addSubview(dataLabel)
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dataLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

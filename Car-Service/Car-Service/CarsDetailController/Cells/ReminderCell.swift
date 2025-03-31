//
//  ReminderCell.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 25.03.2025.
//

import UIKit

final class ReminderCell: UITableViewCell {
    static let reuseID = "ReminderCell"
    private var iconImage = UIImageView(customImage: UIImage(systemName: "lightbulb"), contentMode: .scaleAspectFit)
    private let dataLabel = UILabel(textColor: .gray, fontSize: 16)
    private let txtLabel = UILabel(fontSize: 20, isBold: true)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        iconImage.tintColor = .black
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
    }
    
    private func setConstraints() {
        addSubview(iconImage)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImage.leftAnchor.constraint(equalTo: leftAnchor),
            iconImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 28),
            iconImage.heightAnchor.constraint(equalToConstant: 28),
        ])
        
        addSubview(dataLabel)
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            dataLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 8)
        ])
        
        addSubview(txtLabel)
        txtLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            txtLabel.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 8),
            txtLabel.leftAnchor.constraint(equalTo: iconImage.rightAnchor, constant: 8),
            txtLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            txtLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func setupCell(reminder: Reminders) {
        
        dataLabel.text = reminder.data
        txtLabel.text = reminder.text
    }
    
    
}

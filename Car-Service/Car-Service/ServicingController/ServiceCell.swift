//
//  ServiceCell.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 02.05.2025.
//

import UIKit

final class ServiceCell: UITableViewCell {
    static let reuseID = "ServiceCell"
    private let carImageView = UIImageView(
        customImage: .opel, contentMode: .scaleAspectFill, cornerRadius: 24)
    private let titleLabel = UILabel(textColor: .white, fontSize: 28, isBold: true)
    private let dateLabel = UILabel(title: "Jun 27, 2022", textColor: .white, fontSize: 22)
    private let backView = UIView()
    private let priceLabel = UILabel(title: "40 $", textColor: .black, fontSize: 20, isBold: true)
    private var id = ""
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        backgroundColor = .clear
        carImageView.clipsToBounds = true
        carImageView.contentMode = .scaleAspectFill
        
        backView.backgroundColor = UIColor(named: "appBgColor")
        backView.clipsToBounds = true
        backView.layer.cornerRadius = 8
        
        titleLabel.layer.shadowOpacity = 0.4
        titleLabel.layer.shadowColor = UIColor.black.cgColor
        titleLabel.layer.shadowRadius = 3
        titleLabel.layer.shadowOffset = .zero
        
        dateLabel.layer.shadowOpacity = 0.4
        dateLabel.layer.shadowColor = UIColor.black.cgColor
        dateLabel.layer.shadowRadius = 3
        dateLabel.layer.shadowOffset = .zero
    }
    
    private func setConstraints() {
        addSubview(carImageView)
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            carImageView.leftAnchor.constraint(equalTo: leftAnchor),
            carImageView.rightAnchor.constraint(equalTo: rightAnchor),
            carImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
        addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: carImageView.topAnchor, constant: 20),
            backView.rightAnchor.constraint(equalTo: carImageView.rightAnchor, constant: -20),
            backView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        backView.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 8),
            priceLabel.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -8),
            priceLabel.centerYAnchor.constraint(equalTo: backView.centerYAnchor)
        ])
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: -5),
            titleLabel.leadingAnchor.constraint(equalTo: carImageView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.bottomAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: -5),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            dateLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: -10)
        ])
    }
    
    func setupCell(service: Servicing) {
        self.id = service.id
        titleLabel.text = service.title
        dateLabel.text = "\(service.date)"
        carImageView.image = UIImage(named: service.images[0])
        priceLabel.text = "\(service.price) $"
    }
}

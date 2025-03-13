//
//  CarCell.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 13.03.2025.
//

import UIKit

final class CarCell: UITableViewCell {
    static let reuseID = "CarCell"
    private let carImage = UIImageView(
        customImage: .opel, contentMode: .scaleAspectFill, cornerRadius: 24)
    private let titleLabel = UILabel(fontSize: 28, isBold: true)
    private let containerView = UIView()
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
        carImage.clipsToBounds = true
        containerView.backgroundColor = .bgCell
        containerView.layer.cornerRadius = 24
        containerView.clipsToBounds = true
    }
    
    private func setConstraints() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerView.leftAnchor.constraint(equalTo: leftAnchor),
            containerView.rightAnchor.constraint(equalTo: rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
        containerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10)
        ])
        
        containerView.addSubview(carImage)
        carImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            carImage.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            carImage.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            carImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    func setupCell(car: Cars) {
        self.id = car.id
        titleLabel.text = "\(car.title), \(car.year)"
        carImage.image = UIImage(named: car.imgTitle)
    }
    
}

//
//  CarInfoView.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 19.03.2025.
//

import UIKit

enum CarInfoCategory: String {
    case fuelType
    case transmission
    case seats
    
    var subTitle: String {
        switch self {
        case .fuelType:
            return "Fuel Type"
        case .transmission:
            return "Transmission"
        case .seats:
            return "Seats"
        }
    }
    
    var iconName: String {
        switch self {
        case .fuelType:
            return "fuelpump"
        case .transmission:
            return "gearshift.layout.sixspeed"
        case .seats:
            return "carseat.left"
        }
    }
}

final class CarInfoView: UIView {
    private var titleLabel = UILabel(title: "Gas", textColor: .black, fontSize: 16, lines: 1, isBold: true)
    private lazy var typeOfInfoLabel = UILabel(title: infoType.subTitle, textColor: .gray, fontSize: 12, lines: 1)
    private lazy var iconImage = UIImageView(customImage: UIImage(systemName: infoType.iconName), contentMode: .scaleAspectFill)
    var infoType: CarInfoCategory
    
    init(infoType: CarInfoCategory) {
        self.infoType = infoType
        super.init(frame: .zero)
        setupView()
        setConstraints()
    }
    
    func setupTitle(_ labelText: String) {
        titleLabel.text = labelText
        //        switch infoType {
        //        case .fuelType:
        //            titleLabel.text = "\(car.fuelType.rawValue)"
        //        case .transmission:
        //            titleLabel.text = "\(car.transmission.rawValue)"
        //        case .seats:
        //            titleLabel.text =  "\(car.seats) seats"
        //        }
    }
    
    private func setupView() {
        titleLabel.textAlignment = .center
        typeOfInfoLabel.textAlignment = .center
        iconImage.tintColor = .black
    }
    
    private func setConstraints() {
        addSubview(iconImage)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImage.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            iconImage.widthAnchor.constraint(equalToConstant: 22)
        ])
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4)
        ])
        
        addSubview(typeOfInfoLabel)
        typeOfInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            typeOfInfoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            typeOfInfoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            typeOfInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            typeOfInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

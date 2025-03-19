//
//  CarInfoView.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 19.03.2025.
//

import UIKit

enum CarInfoCategory: String {
    case fuelType = "Fuel Type"
    case transmission = "Transmission"
    case seats = "Seats"
}

final class CarInfoView: UIView {
    var titleLabel = UILabel(title: "Gas", textColor: .black, fontSize: 16, isBold: true)
    var typeOfInfo: CarInfoCategory
    var typeOfInfoLabel = UILabel(title: "Gas", textColor: .gray, fontSize: 12)
    
    
    init(typeOfInfo: CarInfoCategory) {
        self.typeOfInfo = typeOfInfo
        super.init(frame: .zero)
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        titleLabel.textAlignment = .center
        typeOfInfoLabel.text = typeOfInfo.rawValue
        typeOfInfoLabel.textAlignment = .center
    }
    
    private func setConstraints() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        addSubview(typeOfInfoLabel)
        typeOfInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            typeOfInfoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            typeOfInfoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
   
    
    
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

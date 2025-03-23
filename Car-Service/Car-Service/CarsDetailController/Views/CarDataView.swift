//
//  CarDetailView.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 20.03.2025.
//

import UIKit

enum CarDataCategory: String {
    case information
    case servicing
    
    var heading: String {
        switch self {
        case .information:
            return "Car Information"
        case .servicing:
            return "Servicing"
        }
    }
    
    var firstTitle: String {
        switch self {
        case .information:
            return "Buying"
        case .servicing:
            return "Last Service"
        }
    }
    
    var secondTitle: String {
        switch self {
        case .information:
            return "VIN"
        case .servicing:
            return "Service History"
        }
    }
}

final class CarDataView: UIView {

    private lazy var headingLabel = UILabel(title: infoType.heading, textColor: .black, fontSize: 22, lines: 1, isBold: true)
    private lazy var firstTitleLabel = UILabel(title: infoType.firstTitle, textColor: .gray, fontSize: 16, lines: 1)
    private lazy var secondTitleLabel = UILabel(title: infoType.secondTitle, textColor: .gray, fontSize: 16, lines: 1)
    private var firstInfoLabel = UILabel(title: "Jun 17, 2022", textColor: .black, fontSize: 18, lines: 1, isBold: true)
    private var secondInfoLabel = UILabel(title: "See More", textColor: .black, fontSize: 18, lines: 1, isBold: true)
    var infoType: CarDataCategory
    
    init(infoType: CarDataCategory) {
        self.infoType = infoType
        super.init(frame: .zero)
        setViews()
        setConstraints()
    }
    
    func setupView(car: Cars) {
                switch infoType {
                case .information:
                    firstInfoLabel.text = "\(car.buying)" //Треба буде перетворювати data в рядок
                    secondInfoLabel.text = "\(car.numVIN)"
                case .servicing:
                    firstInfoLabel.text = "Last service Data"//Створити модель даних під сервіси і перевіряти чи вони є в масиві. Якщо є то брати дату першого сервісу
                }
    }
    
    private func setViews() {
        
    }
    
    private func setConstraints() {
        addSubview(headingLabel)
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            headingLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        let titleStack = UIStackView(views: [firstTitleLabel, secondTitleLabel], axis: .horizontal, aligment: .center)
//        titleStack.distribution = .equalCentering
        addSubview(titleStack)
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleStack.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 8),
            titleStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondTitleLabel.leftAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        let infoStack = UIStackView(views: [firstInfoLabel, secondInfoLabel], axis: .horizontal, aligment: .center)
//        infoStack.distribution = .equalCentering
        addSubview(infoStack)
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoStack.topAnchor.constraint(equalTo: titleStack.bottomAnchor, constant: 8),
            infoStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            secondInfoLabel.leftAnchor.constraint(equalTo: centerXAnchor),
            secondInfoLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -8)
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

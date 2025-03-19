//
//  ImgCell.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 17.03.2025.
//

import UIKit

class ImgCell: UICollectionViewCell {
    static let reusedID = "ImgCell"
    private let carImageView = UIImageView(customImage: UIImage(named: "volvo"), contentMode: .scaleAspectFill)
    private let carRegNumberLabel = UILabel(title: "", fontSize: 24, isBold: true)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    func setupCell(img: String, regNumber: String, imgCount: Int) {
        carRegNumberLabel.text = regNumber
        carImageView.image = UIImage(named: img)
        }
    
    private func setViews() {
        backgroundColor = .white
    }

    
    private func setConstraints() {
        addSubview(carImageView)
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: topAnchor),
            carImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            carImageView.leftAnchor.constraint(equalTo: leftAnchor),
            carImageView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

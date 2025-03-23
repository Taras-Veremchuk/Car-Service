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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    func setupCell(img: String, imgCount: Int) {
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

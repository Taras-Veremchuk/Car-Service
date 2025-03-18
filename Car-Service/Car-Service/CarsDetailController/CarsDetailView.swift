//
//  CarsDetailView.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 16.03.2025.
//

import UIKit

final class CarsDetailView: UIView {
    
    private let titleLabel = UILabel(title: "Car", textColor: .black, fontSize: 28, isBold: true)
    private let yearLabel = UILabel(title: "2022", textColor: .black, fontSize: 28, isBold: true)
    private let seatsLabel = UILabel(title: "5 Seats", textColor: .black, fontSize: 18, isBold: true)
    private let transmissionLabel = UILabel(title: "Manual", textColor: .black, fontSize: 18, isBold: true)
    private let fuelTypeLabel = UILabel(title: "Gas", textColor: .black, fontSize: 18, isBold: true)
    private let buyingLabel = UILabel(title: "2020", textColor: .black, fontSize: 18, isBold: true)
    private let numVINLabel = UILabel(title: "WOLO089088787979", textColor: .black, fontSize: 18, isBold: true)
    private var imageCollection = [UIImageView]()
    var pageControl = UIPageControl()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(ImgCell.self, forCellWithReuseIdentifier: ImgCell.reusedID)
        return collectionView
    }()
    
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setViews()
        setupCollectionView()
        setConstraints()
        setupPageControl()
    }
    
    private func setupPageControl() {
       pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
    }

    @objc func pageControlTapped(_ sender: UIPageControl) {
        let index = sender.currentPage
        let indexPath = IndexPath(item: index, section: 0)
        
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func setUpView(_ car: Cars) {
        titleLabel.text = car.title
        yearLabel.text = String(car.year)
        seatsLabel.text =  "\(car.seats) seats"
        transmissionLabel.text = "\(car.transmission)"
        fuelTypeLabel.text = "\(car.fuelType)"
        buyingLabel.text = "\(car.buying)"
        numVINLabel.text = "\(car.numVIN)"
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    
    private func setViews() {
        backgroundColor = .white
        pageControl.backgroundStyle = .prominent
    }
    
    
    private func setConstraints() {
        addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.widthAnchor.constraint(equalToConstant: 80),
            pageControl.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

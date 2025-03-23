//
//  CarsDetailView.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 16.03.2025.
//

import UIKit

final class CarsDetailView: UIView {
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private let seatsView = CarInfoView(infoType: .seats)
    private let fuelTypeView = CarInfoView(infoType: .fuelType)
    private let transmissionView = CarInfoView(infoType: .transmission)
    private let infoView = CarDataView(infoType: .information)
    private let servicingView = CarDataView(infoType: .servicing)
    private let lineView = SplitLineView()
    private let secondLineView = SplitLineView()
    private let thirdLineView = SplitLineView()
    private let titleLabel = UILabel(title: "Car", textColor: .black, fontSize: 28, isBold: true)
    private let elementOfStackSize: CGFloat = 100
    private let regNumLabel = UILabel(title: "ST40493", textColor: .black, fontSize: 20, isBold: true)
    private var imageCollection = [UIImageView]()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.alwaysBounceHorizontal = true
        collectionView.isPagingEnabled = true
        collectionView.register(ImgCell.self, forCellWithReuseIdentifier: ImgCell.reusedID)
        return collectionView
    }()
    var pageControl = UIPageControl()
    var stack = UIStackView()
    
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setViews()
        setConstraints()
        setupPageControl()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
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
        titleLabel.text = "\(car.title), \(car.year)"
        seatsView.setupTitle("\(car.seats) Seats")
        transmissionView.setupTitle("\(car.transmission.rawValue)")
        fuelTypeView.setupTitle("\(car.fuelType.rawValue)")
        infoView.setupView(car: car)
        servicingView.setupView(car: car)
        regNumLabel.text = car.carRegNumber
        //TO DELETE
        regNumLabel.widthAnchor.constraint(
            equalToConstant: widthOfLabel(car.carRegNumber)
        ).isActive = true
    }
    
    private func setViews() {
        backgroundColor = .white
        pageControl.backgroundStyle = .minimal
        seatsView.backgroundColor = .bgCell
        transmissionView.backgroundColor = .bgCell
        fuelTypeView.backgroundColor = .bgCell
        seatsView.layer.cornerRadius = 16
        transmissionView.layer.cornerRadius = 16
        fuelTypeView.layer.cornerRadius = 16
        transmissionView.clipsToBounds = true
        
        regNumLabel.backgroundColor = UIColor(named: "appBgColor")
        regNumLabel.textAlignment = .center
        regNumLabel.layer.cornerRadius = 16
        regNumLabel.clipsToBounds = true
        regNumLabel.layer.cornerRadius = 8
    }
    
    private func widthOfLabel(_ labelText: String) -> CGFloat {
        return CGFloat(16 + labelText.count * 12)
    }
    
    private func setConstraints() {
        scrollView.backgroundColor = .red
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        
        scrollView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        containerView.backgroundColor = .green
        
        containerView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: containerView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        containerView.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            pageControl.widthAnchor.constraint(equalToConstant: 80),
            pageControl.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        containerView.addSubview(regNumLabel)
        regNumLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            regNumLabel.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 20),
            regNumLabel.rightAnchor.constraint(equalTo: collectionView.rightAnchor, constant: -20),
            regNumLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        containerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        stack = UIStackView(views: [fuelTypeView, transmissionView, seatsView], axis: .horizontal, aligment: .center)
        stack.distribution = .equalCentering
        containerView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            stack.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            stack.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            fuelTypeView.widthAnchor.constraint(equalToConstant: elementOfStackSize),
            fuelTypeView.heightAnchor.constraint(equalToConstant: elementOfStackSize),
            transmissionView.widthAnchor.constraint(equalToConstant: elementOfStackSize),
            transmissionView.heightAnchor.constraint(equalToConstant: elementOfStackSize),
            seatsView.widthAnchor.constraint(equalToConstant: elementOfStackSize),
            seatsView.heightAnchor.constraint(equalToConstant: elementOfStackSize)
        ])
        
        containerView.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 8),
            lineView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            lineView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20)
        ])
        
        containerView.addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: lineView.bottomAnchor),
            infoView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            infoView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20)
        ])
        
        containerView.addSubview(secondLineView)
        NSLayoutConstraint.activate([
            secondLineView.topAnchor.constraint(equalTo: infoView.bottomAnchor),
            secondLineView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            secondLineView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20)
        ])
        
        containerView.addSubview(servicingView)
        servicingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            servicingView.topAnchor.constraint(equalTo: secondLineView.bottomAnchor),
            servicingView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            servicingView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20)
        ])
        
        containerView.addSubview(thirdLineView)
        NSLayoutConstraint.activate([
            thirdLineView.topAnchor.constraint(equalTo: servicingView.bottomAnchor),
            thirdLineView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            thirdLineView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            thirdLineView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

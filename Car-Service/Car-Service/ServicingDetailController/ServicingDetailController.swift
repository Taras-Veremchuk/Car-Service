//
//  ServicingDetailController.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 02.05.2025.
//

import UIKit

class ServicingDetailController: UIViewController {
    private let mainView = ServicingDetailView()
    var service = Servicing(title: "Clean", images: [".opel"], date: Date(), mileage: 120000, price: 30, description: "Cleaned all car in the side")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupDelegates()
    }
    
    private func setupViews() {
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(
                equalTo: view.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        mainView.setupView(service)
    }
    
    private func setupDelegates() {
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
    }

}

extension ServicingDetailController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let imageCount = service.images.count
        mainView.pageControl.currentPage = 0
        mainView.pageControl.numberOfPages = imageCount
        mainView.pageControl.isHidden = !(imageCount > 1)
        return imageCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentImg = service.images[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImgCell.reusedID, for: indexPath) as? ImgCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(img: currentImg, imgCount: service.images.count)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        mainView.pageControl.currentPage = indexPath.row
    }
}

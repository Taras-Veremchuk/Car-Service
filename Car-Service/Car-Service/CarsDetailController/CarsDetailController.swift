//
//  CarsDetailController.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 16.03.2025.
//

import UIKit

final class CarsDetailController: UIViewController {
    private let mainView = CarsDetailView()
    
    var car = Cars(title: "", year: 0, images: [".opel"], seats: 4,
                   transmission: .automatic,
                   fuelType: .diesel,
                   buying: 2020,
                   numVIN: "WOLO9849384983", carRegNumber: "ST43093")
    var reminders = Reminders.getMockData() {
        didSet {
            mainView.tableView.reloadData()
            mainView.updateTableViewHeight()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupDelegates()
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.mainView.tableView.reloadData()
//            self.mainView.updateTableViewHeight()
//        }
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
        mainView.setUpView(car)
    }
    
    private func setupDelegates() {
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
}

extension CarsDetailController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let imageCount = car.images.count
        mainView.pageControl.currentPage = 0
        mainView.pageControl.numberOfPages = imageCount
        mainView.pageControl.isHidden = !(imageCount > 1)
        return imageCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentImg = car.images[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImgCell.reusedID, for: indexPath) as? ImgCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(img: currentImg, imgCount: car.images.count)
        mainView.updateTableViewHeight()
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

extension CarsDetailController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReminderCell.reuseID) as? ReminderCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        if !reminders.isEmpty {
            cell.setupCell(reminder: reminders[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    
}

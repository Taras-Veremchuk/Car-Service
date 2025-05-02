//
//  CarsCatalogController.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 13.03.2025.
//

import UIKit

final class CarsCatalogController: UIViewController {
    let mainView = CarsCatalogView()
    var cars = Cars.getMockData() {
        didSet {
            mainView.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Your Cars"
        setupViews()
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
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
}

extension CarsCatalogController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarCell.reuseID) as? CarCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        if !cars.isEmpty {
            cell.setupCell(car: cars[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CarsDetailController()
        vc.car = cars[indexPath.item]
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            let actionSheet = UIAlertController(title: "Are You shure?",
                                                message: "Do you want to delete a car?",
                                                preferredStyle: .actionSheet)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive) { _ in
                self.cars.remove(at: indexPath.row)
                self.dismiss(animated: true)
            }
            
            let noAction = UIAlertAction(title: "No", style: .cancel) { _ in
                self.mainView.tableView.reloadData()
            }
            
            actionSheet.addAction(yesAction)
            actionSheet.addAction(noAction)
            
            self.present(actionSheet, animated: true)
        }
    
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        return config
    }
}

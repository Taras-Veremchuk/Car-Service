//
//  ReminderDetailController.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 03.04.2025.
//

import UIKit

class ReminderDetailController: UIViewController {
    let mainView = ReminderDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }


}

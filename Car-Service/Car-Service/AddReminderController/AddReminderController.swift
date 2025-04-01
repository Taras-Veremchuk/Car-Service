//
//  AddReminderController.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 01.04.2025.
//

import UIKit

class AddReminderController: UIViewController {
    private let mainView = AddReminderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        title = "Add Reminder"
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

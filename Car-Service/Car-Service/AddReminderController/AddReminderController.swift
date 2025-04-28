//
//  AddReminderController.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 01.04.2025.
//

import UIKit
protocol AddReminderViewControllerDelegate: AnyObject {
    func reminderCreated(_ reminder: Reminders)
}

class AddReminderController: UIViewController {
    private let mainView = AddReminderView()
    weak var delegate: AddReminderViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureCreateReminderBtn()
        title = "Add Reminder"
    }
    
    private func configureCreateReminderBtn() {
        mainView.createReminderBtn.addTarget(
            self, action: #selector(createButtonTapped), for: .touchUpInside)
        }
        
@objc func createButtonTapped() {
    guard !mainView.textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
        showAlert("Text is empty")
        return
    }
    let newReminder = Reminders(date: mainView.datePicker.date, text: mainView.textView.text)
    delegate?.reminderCreated(newReminder)
    navigationController?.popViewController(animated: true)
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

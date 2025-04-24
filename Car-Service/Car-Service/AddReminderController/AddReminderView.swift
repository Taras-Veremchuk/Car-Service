//
//  AddReminderView.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 01.04.2025.
//

import UIKit

class AddReminderView: UIView, UITextViewDelegate {
    private let startLabel = UILabel(title: "Start", textColor: .gray, fontSize: 16, isBold: false)
    
    let datePicker = UIDatePicker()
    private var textViewHeightConstraint: NSLayoutConstraint!
    private let notesTitleLabel = UILabel(title: "Notes", textColor: .gray, fontSize: 16)
    private let textView = UITextView()
    
    init() {
        super.init(frame: .zero)
        setViews()
        setupTextView()
        setConstraints()
        configureDatePicker()
    }
    
    private func configureDatePicker() {
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        datePicker.datePickerMode = .dateAndTime
        datePicker.locale = .current
        datePicker.preferredDatePickerStyle = .compact
        
        let todayDate = Date()
        var twoYearTime = TimeInterval()
        twoYearTime = (365 * 24 * 60 * 60) * 2
        let twoYearFromDate = todayDate.addingTimeInterval(twoYearTime)
        datePicker.minimumDate = todayDate
        datePicker.maximumDate = twoYearFromDate
    }
    
    @objc private func dateChanged(object: UIDatePicker) {
        if object.isEqual(self.datePicker){
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
//            dateTextField.text = formatter.string(from: datePicker.date)
        }
    }
    
    private func setViews() {
        backgroundColor = .appBg
    }
    
    private func setupTextView() {
        textView.delegate = self
        textView.font = .systemFont(ofSize: 18)
        textView.textColor = .label
        textView.borderStyle = .none
        textView.backgroundColor = .bgCell
        textView.isScrollEnabled = false
        textView.layer.cornerRadius = 16
        textView.layer.masksToBounds = true
        
    }
    
    private func setConstraints() {
        addSubview(startLabel)
        startLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            startLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: startLabel.bottomAnchor, constant: 16),
            datePicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        addSubview(notesTitleLabel)
        notesTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            notesTitleLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 16),
            notesTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textViewHeightConstraint = textView.heightAnchor.constraint(equalToConstant: 200)
        NSLayoutConstraint.activate([
            textViewHeightConstraint,
            textView.topAnchor.constraint(equalTo: notesTitleLabel.bottomAnchor, constant: 16),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let fittingSize = CGSize(width: textView.frame.width, height: .greatestFiniteMagnitude)
            let newSize = textView.sizeThatFits(fittingSize)

            let clampedHeight = min(max(newSize.height, 200), 300)
            textView.isScrollEnabled = newSize.height > 300
            textViewHeightConstraint.constant = clampedHeight
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


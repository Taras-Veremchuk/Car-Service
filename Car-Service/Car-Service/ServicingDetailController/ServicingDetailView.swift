//
//  ServicingDetailView.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 02.05.2025.
//

import UIKit

final class ServicingDetailView: UIView, UITextViewDelegate, UITextFieldDelegate {
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    
    let saveButton = UIButton(type: .system)
    
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
        return collectionView }()
    var pageControl = UIPageControl()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.borderStyle = .none
        textField.font = .boldSystemFont(ofSize: 24)
        textField.attributedPlaceholder = NSAttributedString(
            string: "Title",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        return textField
    }()
    
    private let dateLabel = UILabel(title: "Completed date", textColor: .gray, fontSize: 16)
    private let datePicker = UIDatePicker()
    
    private let mileageLabel = UILabel(title: "Mileage", textColor: .gray, fontSize: 16)
    private let mileageTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.borderStyle = .none
        textField.font = .boldSystemFont(ofSize: 18)
        textField.attributedPlaceholder = NSAttributedString(
            string: "km",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        return textField
    }()
    
    private let priceLabel = UILabel(title: "Price", textColor: .gray, fontSize: 16)
    private let priceTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.borderStyle = .none
        textField.font = .boldSystemFont(ofSize: 18)
        textField.attributedPlaceholder = NSAttributedString(
            string: "$",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        return textField
    }()
    
    private let textLabel = UILabel(title: "Description", textColor: .gray, fontSize: 16)
    private let textView = UITextView(font: .systemFont(ofSize: 18), textColor: .label)
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupScrollView()
        setupPageControl()
        setConstraints()
        setupKeyboardObservers()
        setupTapToDismissKeyboard()
        configureDatePicker()
        setupNavigationSaveButton()
        titleTextField.delegate = self
        mileageTextField.delegate = self
        priceTextField.delegate = self
        textView.delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupNavigationSaveButton() {
        var config = UIButton.Configuration.filled()
        config.title = "save"
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 12, bottom: 5, trailing: 12)
        config.cornerStyle = .medium
        saveButton.configuration = config
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.gray.cgColor
        saveButton.layer.cornerRadius = 8
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
    }
    
    @objc private func saveTapped() {
        print("Save button tapped")
    }
    
    private func setupScrollView() {
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
    }

    private func setupPageControl() {
        pageControl.backgroundStyle = .minimal
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
    }
    
    @objc func pageControlTapped(_ sender: UIPageControl) {
        let index = sender.currentPage
        let indexPath = IndexPath(item: index, section: 0)
        
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func setupView(_ service: Servicing) {
        
    }
    
    // MARK: - UIDatePicker
    private func configureDatePicker() {
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        datePicker.datePickerMode = .date
        datePicker.locale = .current
        datePicker.preferredDatePickerStyle = .compact
        datePicker.minimumDate = Date()
    }
    @objc private func dateChanged(object: UIDatePicker) {
        if object.isEqual(self.datePicker){
            let formatter = DateFormatter()
            formatter.dateStyle = .short
        }
    }
    // MARK: - Constraints
    private func setConstraints() {
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
        
        containerView.addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
        ])
        
        containerView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            dateLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 16)
        ])
        containerView.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 12),
            datePicker.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
        ])
        
        containerView.addSubview(mileageLabel)
        mileageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mileageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            mileageLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 16)
        ])
        containerView.addSubview(mileageTextField)
        mileageTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mileageTextField.heightAnchor.constraint(equalToConstant: 40),
            mileageTextField.topAnchor.constraint(equalTo: mileageLabel.bottomAnchor, constant: 12),
            mileageTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            mileageTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])
        
        containerView.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            priceLabel.topAnchor.constraint(equalTo: mileageTextField.bottomAnchor, constant: 16)
        ])
        containerView.addSubview(priceTextField)
        priceTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceTextField.heightAnchor.constraint(equalToConstant: 40),
            priceTextField.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 12),
            priceTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            priceTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])
        
        containerView.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            textLabel.topAnchor.constraint(equalTo: priceTextField.bottomAnchor, constant: 16)
        ])
        containerView.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.heightAnchor.constraint(equalToConstant: 100),
            textView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 12),
            textView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    // MARK: - UITextViewDelegate
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: textView.frame.width, height: .greatestFiniteMagnitude)
        let estimatedSize = textView.sizeThatFits(size)
        if estimatedSize.height > 100 {
            textView.isScrollEnabled = true
        } else {
            textView.isScrollEnabled = false
            scrollToCaret()
        }
    }

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        textView.isScrollEnabled = false
        return true
    }
    func scrollToCaret() {
        guard let selectedRange = textView.selectedTextRange else { return }
        let caretRect = textView.caretRect(for: selectedRange.end)
        textView.scrollRectToVisible(caretRect, animated: true)
    }
    //MARK: - SetupKeyboar
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height + 20, right: 0)
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
    }

    @objc private func keyboardWillHide(notification: Notification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }

    private func setupTapToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        scrollView.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        self.endEditing(true)
    }
    //MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField,
                      shouldChangeCharactersIn range: NSRange,
                      replacementString string: String) -> Bool {
           let currentText = textField.text ?? ""
           guard let stringRange = Range(range, in: currentText) else {
               return false
           }
           let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
           return updatedText.count <= 25
       }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleTextField {
            self.titleTextField.resignFirstResponder()
        }
        return true
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

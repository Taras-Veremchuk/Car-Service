//
//  ServicingDetailView.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 02.05.2025.
//

import UIKit

final class ServicingDetailView: UIView, UITextViewDelegate, UITextFieldDelegate {
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
    
    private let titleTextField = UITextField(placeholder: "Title")
    
    private let dateLabel = UILabel(title: "Completed date", textColor: .gray, fontSize: 16)
    private let dateView = UITextView(font: .systemFont(ofSize: 18), textColor: .label, maxNumberOfLines: 1)
    
    private let mileageLabel = UILabel(title: "Mileage", textColor: .gray, fontSize: 16)
    private let mileageView = UITextView(font: .systemFont(ofSize: 18), textColor: .label, maxNumberOfLines: 1)
    
    private let priceLabel = UILabel(title: "Price", textColor: .gray, fontSize: 16)
    private let priceView = UITextView(font: .systemFont(ofSize: 18), textColor: .label, maxNumberOfLines: 1)
    
    private let textLabel = UILabel(title: "Description", textColor: .gray, fontSize: 16)
    private var textViewHeightConstraint: NSLayoutConstraint!
    private let textView = UITextView(font: .systemFont(ofSize: 18), textColor: .label)
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setViews()
        setConstraints()
        setupPageControl()
        createTitleTextField()
        titleTextField.delegate = self
        dateView.delegate = self
        mileageView.delegate = self
        priceView.delegate = self
        textView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.titleView.resignFirstResponder()
//        self.dateView.resignFirstResponder()
//        self.mileageView.resignFirstResponder()
//        self.priceView.resignFirstResponder()
//        self.textView.resignFirstResponder()
//    }

    private func createTitleTextField() {
        titleTextField.borderStyle = .none
        titleTextField.backgroundColor = .clear
        titleTextField.font = .boldSystemFont(ofSize: 28)
        titleTextField.textAlignment = .left
        
    }
    
    private func setupPageControl() {
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
    }
    
    @objc func pageControlTapped(_ sender: UIPageControl) {
        let index = sender.currentPage
        let indexPath = IndexPath(item: index, section: 0)
        
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private func setViews() {
        pageControl.backgroundStyle = .minimal
    }
    
    private func setConstraints() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.widthAnchor.constraint(equalToConstant: 80),
            pageControl.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dateLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 16)
        ])
        addSubview(dateView)
        dateView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateView.heightAnchor.constraint(equalToConstant: 40),
            dateView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 12),
            dateView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dateView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        addSubview(mileageLabel)
        mileageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mileageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mileageLabel.topAnchor.constraint(equalTo: dateView.bottomAnchor, constant: 16)
        ])
        addSubview(mileageView)
        mileageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mileageView.heightAnchor.constraint(equalToConstant: 40),
            mileageView.topAnchor.constraint(equalTo: mileageLabel.bottomAnchor, constant: 12),
            mileageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mileageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            priceLabel.topAnchor.constraint(equalTo: mileageView.bottomAnchor, constant: 16)
        ])
        addSubview(priceView)
        priceView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceView.heightAnchor.constraint(equalToConstant: 40),
            priceView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 12),
            priceView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            priceView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textLabel.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 16)
        ])
        addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textViewHeightConstraint = textView.heightAnchor.constraint(equalToConstant: 200)
        NSLayoutConstraint.activate([
            textViewHeightConstraint,
            textView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 12),
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
    
    func setupView(_ service: Servicing) {
        
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing ")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        true
    }
}

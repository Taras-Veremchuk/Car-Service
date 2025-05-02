//
//  Servicing.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 02.05.2025.
//

import UIKit

struct Servicing: Identifiable {
    var id: String = UUID().uuidString
    let title: String
    let images: [String]
    let date: Date
    let mileage: Int
    let price: Int
    let description: String
    
    static func getMockData() -> [Servicing] {
        let mockData: [Servicing] = [.init(title: "Hamulce fbfdjk dfjkdk dfjkdf dfkjhkhd kidfhkd", images: ["volvo", "bmw"], date: Date(), mileage: 15000, price: 350, description: "Przod i tyl"),
            .init(title: "Lampa", images: ["bmw", "mustang"], date: Date(), mileage: 35000, price: 40, description: "Polerka"),
            .init(title: "Clean", images: ["opel"], date: Date(), mileage: 16000, price: 45, description: "Czyszczenie w sriodku"),
            .init(title: "Filtry", images: ["volvo"], date: Date(), mileage: 10000, price: 50, description: "Filtry paliwa i powietrza"),
            .init(title: "Oleje", images: ["opel"], date: Date(), mileage: 120000, price: 550, description: "Olej silnika")
        ]
        return mockData
    }
}

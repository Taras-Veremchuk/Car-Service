//
//  Cars.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 13.03.2025.
//


import UIKit

struct Cars: Identifiable {
    var id: String = UUID().uuidString
    let title: String
    let year: Int
    let imgTitle: String

    static func getMockData() -> [Cars] {
        let mockData: [Cars] = [
            .init(
                title: "Opel Astra 2G", year: 2004,
                imgTitle: "opel"),
            .init(
                title: "BMW Series 3", year: 2021,
                imgTitle: "bmw"),
            .init(
                title: "Mustang", year: 2000, imgTitle: "mustang"),
            .init(
                title: "Volvo", year: 2024,
                imgTitle: "volvo")
        ]
        return mockData
    }
}

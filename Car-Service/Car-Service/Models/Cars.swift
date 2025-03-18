//
//  Cars.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 13.03.2025.
//


import UIKit

enum Gears: String {
    case manual = "Manual"
    case automatic = "Automatic"
}

enum FuelType: String {
    case petrol = "Petrol"
    case diesel = "Diesel"
    case electric = "Electric"
    case hybrid = "Hybrid"
    case gas = "Gas"
    case hydrogen = "Hydrogen"
}

struct Cars: Identifiable {
    var id: String = UUID().uuidString
    let title: String
    let year: Int
    let images: [String]
    let seats: Int
    let transmission: Gears
    let fuelType: FuelType
    let buying: Int
    let numVIN: String
    let carRegNumber: String

    static func getMockData() -> [Cars] {
        let mockData: [Cars] = [
            .init(
                title: "Opel Astra 2G", year: 2004,
                images: ["opel", "mustang", "volvo"], seats: 4, transmission: .automatic, fuelType: .diesel, buying: 2020, numVIN: "WTO89944374874", carRegNumber: "St30444"),
            .init(
                title: "BMW Series 3", year: 2021,
                images: ["bmw"], seats: 4, transmission: .automatic, fuelType: .diesel, buying: 2020, numVIN: "WTO89944374874", carRegNumber: "St30444"),
            .init(
                title: "Mustang", year: 2000, images: ["mustang"], seats: 4, transmission: .automatic, fuelType: .diesel, buying: 2020, numVIN: "WTO89944374874", carRegNumber: "St30444"),
            .init(
                title: "Volvo", year: 2024,
                images: ["volvo"], seats: 4, transmission: .automatic, fuelType: .diesel, buying: 2020, numVIN: "WTO89944374874", carRegNumber: "St30444")
        ]
        return mockData
    }
}

//
//  Reminders.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 25.03.2025.
//

import UIKit

struct Reminders: Identifiable {
    var id: String = UUID().uuidString
    
    let date: Date
    let text: String
    
    static func getMockData() -> [Reminders] {
        let mockData: [Reminders] = [.init(date: Date(), text: "Fuel a car"),
                                     .init(date: Date(), text: "Change a kolesa Change a kolesaChange a kolesaChange a kolesa"),
                                     .init(date: Date(), text: "Clean")
        ]
        return mockData
    }
}

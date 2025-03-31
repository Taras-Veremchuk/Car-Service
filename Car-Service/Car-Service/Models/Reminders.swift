//
//  Reminders.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 25.03.2025.
//

import UIKit

struct Reminders: Identifiable {
    var id: String = UUID().uuidString
    
    let data: String // Поки що String бо потім треба буде перетворювати з дати
    let text: String
    
    static func getMockData() -> [Reminders] {
        let mockData: [Reminders] = [.init(data: "Today", text: "Fuel a car"),
                                     .init(data: "Jun 16", text: "Change a kolesa Change a kolesaChange a kolesaChange a kolesa"),
                                     .init(data: "Mar 1", text: "Clean"),
                                     .init(data: "Mar 1", text: "Clean"),
                                     .init(data: "Mar 1", text: "Clean"),
                                     .init(data: "VAla 1", text: "Clean"),
                                     .init(data: "Helo 1", text: "Clean"),
                                     .init(data: "May 8", text: "Thjfj")
        ]
        return mockData
    }
}

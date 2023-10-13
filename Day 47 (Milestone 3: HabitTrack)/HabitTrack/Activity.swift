//
//  Activity.swift
//  HabitTrack
//
//  Created by Xenia on 13.10.2023.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String = ""
    var description: String = ""
    var amount: Int = 0
}

//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Xenia on 04.10.2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
}

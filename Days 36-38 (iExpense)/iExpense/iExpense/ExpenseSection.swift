//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Xenia on 05.10.2023.
//

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    
    var totalAmount: Double {
            expenses.map { $0.amount }.reduce(0, +)
        }
    
    var body: some View {
        Section(header: HStack {
            Text(title)
            Spacer()
            Text("Total: \(totalAmount, specifier: "%.2f")")
        }) {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                        Text(item.type)
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .textStyle(for: item)
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
}


struct ExpenseSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSection(title: "eed", expenses: [], deleteItems: { _ in })
    }
}

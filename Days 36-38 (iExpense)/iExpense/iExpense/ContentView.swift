//
//  ContentView.swift
//  iExpense
//
//  Created by Xenia on 04.10.2023.
//

import SwiftUI

struct BeautifulText: ViewModifier {
    let expense: ExpenseItem
    
    func body(content: Content) -> some View {
        switch expense.amount {
        case 0..<10:
            content
                .foregroundColor(.green)
        case 10..<100:
            content
                .foregroundColor(.yellow)
        default:
            content
                .foregroundColor(.red)
                .font(.headline)
        }
    }
}

extension View {
    func textStyle(for expense: ExpenseItem) -> some View {
        modifier(BeautifulText(expense: expense))
    }
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            List {
                ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
                
                ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddView(expenses: expenses)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.hidden)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet){
        removeItems(at: offsets, in: expenses.personalItems)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

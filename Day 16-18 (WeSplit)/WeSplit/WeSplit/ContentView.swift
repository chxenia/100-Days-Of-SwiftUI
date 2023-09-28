//
//  ContentView.swift
//  WeSplit
//
//  Created by Xenia on 13.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var peopleAmount = 0
    @State private var tipAmount = 20
    
    let tips = [0, 10, 20, 25]
    
    var totalPerPerson: Double {

        return (checkAmount + (checkAmount / 100 * Double(tipAmount))) / Double(peopleAmount + 2)
    }
    
    var totalCheck: Double {

        return checkAmount + (checkAmount / 100 * Double(tipAmount))
    }
    
    var body: some View {
        NavigationView {
            
            Form {
                Section {
                    TextField("Check Amount", value: $checkAmount, format: .currency(code: "BYN"))
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Check sum")
                }
                    
                Section {
                    Picker("People Amount", selection: $peopleAmount) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                } header: {
                    Text("People Amount")
                }
                
                Section {
                    Picker("Tip Amount", selection: $tipAmount) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                } header: {
                    Text("Tip amount")
                }
                
                Section {
                    Text(totalCheck, format: .currency(code: "BYN"))
                        .foregroundColor(tipAmount == 0 ? .red : .black)
                } header: {
                    Text("Total for the check")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: "BYN"))
                } header: {
                    Text("How much you should pay")
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

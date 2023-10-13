//
//  AddView.swift
//  HabitTrack
//
//  Created by Xenia on 13.10.2023.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var amount: Int = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section("Enter activity title") {
                        TextField("Title", text: $title)
                    }
                    
                    Section("Enter activity description") {
                        TextField("Description", text: $description)
                    }
                }
            }
            .navigationTitle("Add Activity")
            .toolbar {
                Button {
                    let item = Activity(title: title, description: description, amount: amount)
                    activities.items.append(item)
                    
                    dismiss()
                } label: {
                    Text("Add")
                }

            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}

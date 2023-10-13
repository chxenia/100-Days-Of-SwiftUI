//
//  ContentView.swift
//  HabitTrack
//
//  Created by Xenia on 13.10.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
        
    @State private var showingAddView = false
    
    @State private var title: String = "some"
    @State private var description: String = "desc"
    @State private var amount: Int = 1
    
    
    var body: some View {
        NavigationView {
           
                List {
                    ForEach(activities.items) { item in
                        NavigationLink(destination: ActivityDetailView(activities: activities, activityId: item.id)){
                        HStack {
                            Text(Image(systemName: "\(item.amount).circle"))
                                .padding(10)
                            
                            
                            VStack(spacing: 10){
                                
                                Text(item.title)
                                
                                Text(item.description)
                                    .font(.caption)
                            }
                            
                            Spacer()
                        }
//                        .onTapGesture {
//                            selectedActivity = item
//                        }
                    }
                    
                }
                    .onDelete(perform: deleteItems)

            }
            
            
            .navigationTitle("Habit Track")
            .toolbar {
                Button {
                    showingAddView = true
                } label: {
                    Image(systemName: "plus")
                }

            }
            .sheet(isPresented: $showingAddView) {
                AddView(activities: activities)
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

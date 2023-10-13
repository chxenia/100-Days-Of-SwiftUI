//
//  ActivityDetailView.swift
//  HabitTrack
//
//  Created by Xenia on 13.10.2023.
//

import SwiftUI

struct ActivityDetailView: View {
    @ObservedObject var activities: Activities
    @State var amount: Int = 1

    var activityId: UUID
    
    var activity: Activity {
        activities.getActivity(id: activityId)
    }

    var body: some View {
        NavigationView {
            Form {
                Section("title") {
                    Text("\(activity.title)")
                }
                
                Section("Description") {
                    Text("\(activity.description)")
                }
                
                Section("Times you did it") {
                    
                    Stepper(
                        "Completed \(activity.amount)",
                        onIncrement: { updateActivity(by: 1) },
                        onDecrement: { updateActivity(by: -1)}
                    )
                }
            }
            .navigationTitle("Details")
        }
    }
    
    func updateActivity(by change: Int) {
        var activity = self.activity
        activity.amount += change
        activities.update(activity: activity)
    }
    
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailView(activities: Activities(), activityId: UUID())
    }
}

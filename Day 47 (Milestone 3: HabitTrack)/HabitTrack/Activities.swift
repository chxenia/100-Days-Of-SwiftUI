//
//  Activities.swift
//  HabitTrack
//
//  Created by Xenia on 13.10.2023.
//

import Foundation

class Activities: ObservableObject {
    @Published var items = [Activity]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
    
    func update(activity: Activity) {
        guard let index = getIndex(activity: activity) else { return }
        
        items[index] = activity
        

    }
    
    func getActivity(id: UUID) -> Activity {
        guard let index = getIndex(id: id) else { return Activity(title: "", description: "") }
        
        return items[index]
    }
    
    private func getIndex(id: UUID) -> Int? {
        return items.firstIndex(where: { $0.id == id })
    }
    
    private func getIndex(activity: Activity) -> Int? {
        return items.firstIndex(where: { $0.id == activity.id })
    }
}

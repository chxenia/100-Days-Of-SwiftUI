//
//  ContentView.swift
//  Moonshot
//
//  Created by Xenia on 04.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingGrid = false
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        NavigationView {
            VStack {
                if showingGrid {
                    ScrollView {
                        GridLayout(missions: missions, astronauts: astronauts)
                    }
                } else {
                    ListLayout(missions: missions, astronauts: astronauts)
                        .padding(.vertical)
                        
                }
            }
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    Image(systemName: showingGrid ? "list.bullet" : "square.grid.2x2")
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

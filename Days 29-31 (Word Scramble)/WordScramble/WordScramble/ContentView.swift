//
//  ContentView.swift
//  WordScramble
//
//  Created by Xenia on 23.09.2023.
//

import SwiftUI

struct ContentView: View {
    let people = ["Me", "Not me", "Kill"]
    var body: some View {
        VStack {
            List(people, id: \.self) {
                Text($0)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

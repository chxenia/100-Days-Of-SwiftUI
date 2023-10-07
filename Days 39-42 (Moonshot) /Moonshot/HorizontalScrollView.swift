//
//  HorizontalScrollView.swift
//  Moonshot
//
//  Created by Xenia on 07.10.2023.
//

import SwiftUI

struct HorizontalScrollView: View {
    var crew: [MissionView.CrewMember]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(crew, id: \.role) { crew in
                    NavigationLink {
                        AstronautView(astronaut: crew.astronaut)
                    } label: {
                        HStack {
                            Image(crew.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay {
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                }
                            
                            VStack(alignment: .leading) {
                                Text(crew.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text(crew.role)
                                    .foregroundColor(.secondary)
                            }
                            
                            LineView(isVertical: true, thickness: 2, color: .lightBackground, ifPaddingVertical: false)
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct HorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCrew: [MissionView.CrewMember] = [
            MissionView.CrewMember(role: "main", astronaut: Astronaut(id: "john_doe", name: "John Doe", description: "HI")),
            MissionView.CrewMember(role: "main", astronaut: Astronaut(id: "john_do", name: "John Do", description: "HIsjs")),
        ]
        
        return HorizontalScrollView(crew: sampleCrew)
    }
}

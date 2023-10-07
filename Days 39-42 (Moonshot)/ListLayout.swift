//
//  ListLayout.swift
//  Moonshot
//
//  Created by Xenia on 07.10.2023.
//

import SwiftUI

struct ListLayout: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
            ZStack {
                Color.darkBackground
                    .ignoresSafeArea()
                
                List {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astrounauts: astronauts)
                        } label: {
                            HStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 90)
                                    .padding()
                                
                                Spacer()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(.lightBackground)
                                
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.lightBackground, lineWidth: 4)
                            }
                            
                        }
                    }
                    .listStyle(.plain)
                    .listRowBackground(Color.darkBackground)
                    
                }
                .listStyle(.plain)
                .navigationTitle("Moonshot")
                .preferredColorScheme(.dark)
                
            }
            
        }
}

struct ListLayout_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astonauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        ListLayout(missions: missions, astronauts: astonauts)
    }
}

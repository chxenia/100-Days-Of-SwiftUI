//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Xenia on 23.09.2023.
//

import SwiftUI

struct BeautifulText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.black)
    }
}

extension View {
    func textStyle() -> some View {
        modifier(BeautifulText())
    }
}


struct ContentView: View {
    @State private var possibleMoves = ["✊", "✋", "✌️"]
    @State private var currentRounds = 1
    
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var alertTitle = ""
    @State private var resetGame = false
    
    @State private var currentChoice = Int.random(in: 0...2)
    @State private var winning = Bool.random()
    @State private var playerScore = 0
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .red, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 50){
                
                VStack(spacing: 20){
                    Text("Rock Paper Scissors")
                        .textStyle()
                    
                        Text("Round \(currentRounds)/10")
                            .foregroundColor(.white)
                            .font(.title2.bold())
                    
                }
                
                Text(possibleMoves[currentChoice])
                    .font(Font.system(size: 150))
                
                VStack(spacing: 20){
                    Text("What do you need to do to")
                    Text(winning ? "WIN" : "LOSE")
                        .foregroundColor(.black)
                }
                .foregroundColor(.white)
                
                HStack(spacing: 20){
                    ForEach(0..<3) { num in
                        Button {
                            buttonTapped(num)
                        } label: {
                            Text(possibleMoves[num])
                                .font(Font.system(size: 70))
                        }
                    }
                }
                
                Text("Your score is: \(playerScore)")
                
            }
            .font(.title2.bold())
            .foregroundColor(.white)
            .padding()
            .navigationTitle("RockPaperScissors")
            .alert(alertTitle,isPresented: $showingAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(alertMessage)
            }
            .alert("Game over", isPresented: $resetGame){
                Button("New Game", action: reset)
            } message: {
                Text("Your final score is: \(playerScore)/1000")
            }
        }
    }
    
    func buttonTapped(_ num: Int) {
        let playerChoice = possibleMoves[num]
        let appChoice = possibleMoves[currentChoice]
        
        if (winning && (playerChoice == "✋" && appChoice == "✊" ||
                        playerChoice == "✊" && appChoice == "✌️" ||
                        playerChoice == "✌️" && appChoice == "✋")) ||
            (!winning && (playerChoice == "✋" && appChoice == "✌️" ||
                          playerChoice == "✌️" && appChoice == "✊" ||
                          playerChoice == "✊" && appChoice == "✋")) {
            playerScore += 100
            showingAlert = true
            alertTitle = "You won this round!"
            alertMessage = "Your score is \(playerScore)"
        } else if playerChoice == appChoice {
            playerScore += 50
            showingAlert = true
            alertTitle = "You tie this round!"
            alertMessage = "Your score is \(playerScore)"
        } else {
            if playerScore - 100 >= 0 {
                playerScore -= 100
            }
            showingAlert = true
            alertTitle = "You lost this round!"
            alertMessage = "Your score is \(playerScore)"
        }
        
        currentRounds += 1
        
        
        if currentRounds < 10 {
            possibleMoves.shuffle()
            currentChoice = Int.random(in: 0...2)
            winning = Bool.random()
        } else {
            resetGame = true
            showingAlert = false
        }
    }
    
    func reset() {
        currentRounds = 1
        playerScore = 0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

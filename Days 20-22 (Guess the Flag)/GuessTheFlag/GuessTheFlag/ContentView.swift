//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Xenia on 17.09.2023.
//

import SwiftUI

struct BeautifulText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.white)
    }
}

extension View {
    func textStyle() -> some View {
        modifier(BeautifulText())
    }
}

struct FlagImage: View {
    var fileName: String
    
    var body: some View {
        Image(fileName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 120)
    }
}

struct ContentView: View {
    // Project 6 Ch
    @State private var didTapButton = false
    @State private var whichFlagTapped = 0
    @State private var animationAmount = 0.0
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var resetGame = false
    @State private var roundsPlayed = 1
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color:Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color:Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess The Flag")
                    .textStyle()
                
                VStack(spacing: 15){
                    Text("Question \(roundsPlayed)/8")
                        .font(.title.bold())
                        .foregroundColor(.gray)
                    
                    VStack {
                        Text("Tap the flag of")
                            .foregroundColor(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .textStyle()
                    }
                    
                    ForEach(0..<3) { num in
                        Button {
                            flagTapped(num)
                        } label: {
                            FlagImage(fileName: countries[num])
                        } // Project 6 Challenge
                        .rotation3DEffect(.degrees(whichFlagTapped == num ? animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                        .opacity(didTapButton && whichFlagTapped != num ? 0.25 : 1)
                        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: 1)
                        .scaleEffect(didTapButton && whichFlagTapped != num ? 0.85 : 1, anchor: .center)
                                            
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Your score:  \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
             Text("Your score is \(score)")
        }
        .alert("Game over", isPresented: $resetGame){
            Button("New Game", action: reset)
        } message: {
            Text("Your final score is: \(score)/800")
        }
    }
    
  
    func flagTapped(_ num: Int) {
        
        // Project 6
        didTapButton = true
        whichFlagTapped = num
        withAnimation {
            animationAmount += 360
        }
        
        if num == correctAnswer {
            scoreTitle = "Correct"
            score += 100
        } else {
            scoreTitle = "Wrong. That is the flag of \(countries[num])"
            score -= 100
        }
        
        showingScore = true
        
        roundsPlayed += 1
        
        if roundsPlayed == 8 {
            resetGame = true
            showingScore = false
        }
       
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        didTapButton = false
    }
    
    func reset() {
        askQuestion()
        roundsPlayed = 1
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

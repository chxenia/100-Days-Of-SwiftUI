//
//  ContentView.swift
//  Edutainment
//
//  Created by Xenia on 26.09.2023.
//

import SwiftUI


struct SettingsView : View {
    @Binding var isGameActive: Bool
    @Binding var numOfQuestions: Int
    @Binding var tableNum : Int
    
    @State private var showingAlert = false
    @State private var didTapButton = false
    @State private var didDiffTapButton = false
    @State private var whichColumnTapped = 0
    @State private var whichRowTapped = 0
    
    @State private var isZoomed = false
    @State private var selectedDifficulty: String = ""
    
    
    @State private var isAnimating = false
    
    let difficulty = ["Easy","Medium", "Hard"]
    let difficultyColors: [Color] = [.green, .yellow, .red]
    
    
    let gradientColors = [
        Color(red: 0.289, green: 0.561, blue: 1),
        Color(red: 0.210, green: 0.413, blue: 1)
    ]
    
    let colors: [Color] = [
        .red, .green, .orange, .purple,
        .pink, .yellow, .gray, .teal, .cyan,
        .mint, .indigo, .red
    ]
    
    let buttonsPerRow = 4
    let totalButtons = 11
    let lastRowButtons = [10, 11, 12]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            //            Spacer()
            
            VStack {
                Text("Choose your multiplication number")
                    .foregroundColor(.white)
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)
                    .textCase(.uppercase)
                    .padding(20)
                
                ForEach(0..<totalButtons/buttonsPerRow) { row in
                    HStack {
                        ForEach(0..<buttonsPerRow) { column in
                            Button(action: {
                                btnTapped(column, row)
                            }) {
                                Text("\(row * buttonsPerRow + column + 2)")
                                    .font(.title.bold())
                                    .styleBtn()
                                    .padding(5)
                                    .background(colors.randomElement())
                                    .cornerRadius(10)
                                    .offset(x: isAnimating ? -10 : 10)
                                
                            }
                            .opacity(didTapButton && (whichColumnTapped != column || whichRowTapped != row) ? 0.25 : 1)
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 1.0).repeatForever()){
                                    isAnimating.toggle()
                                }
                            }
                            
                        }
                    }
                }
                HStack {
                    ForEach(lastRowButtons, id: \.self) { number in
                        Button(action: {
                            btnTapped(number, 0)
                        }) {
                            Text("\(number)")
                                .font(.title.bold())
                                .styleBtn()
                                .padding(5)
                                .background(colors.randomElement())
                                .cornerRadius(10)
                                .offset(x: isAnimating ? -10 : 10)
                            
                        }
                        .opacity(didTapButton && (whichColumnTapped != number) ? 0.25 : 1)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 3).repeatForever()){
                                isAnimating.toggle()
                            }
                        }
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("Choose your difficulty")
                        .foregroundColor(.white)
                        .font(.title.bold())
                        .multilineTextAlignment(.center)
                        .textCase(.uppercase)
                    
                    HStack {
                        
                        ForEach(difficulty, id: \.self) { diffLevel in
                            Button(action: {
                                diffBtnTapped(diffLevel)
                            }) {
                                Text(diffLevel)
                                    .font(.title)
                                    .frame(width: 100, height: 50)
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(
                                        Capsule()
                                            .fill(
                                                diffLevel == "Easy" ? Color.green :
                                                    diffLevel == "Medium" ? Color.yellow :
                                                    diffLevel == "Hard" ? Color.red :
                                                    Color.clear
                                            )
                                    )
                                
                            }
                            .opacity(didDiffTapButton && selectedDifficulty != diffLevel ? 0.25 : 1)
                        }
                    }
                }
                
                Spacer()
                
                Button(action: {
                    startGame()
                }) {
                    Text("Start Game")
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                        .textCase(.uppercase)
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Capsule().fill(Color.yellow.opacity(0.8)))
                .scaleEffect(isZoomed ? 1.1 : 1.0)
                .animation(
                    Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: true)
                )
                .onAppear {
                    self.isZoomed.toggle()
                }
                .alert("Settings weren't chosen", isPresented: $showingAlert) {
                    Button("OK", role: .cancel, action: startGame)
                } message: {
                    Text("Choose all the settings in order to continue")
                }
                
                
                
                
                Spacer()
            }
        }
    }
    
    func btnTapped(_ column: Int, _ row: Int) {
        didTapButton = true
        whichColumnTapped = column
        whichRowTapped = row
        
        if row == totalButtons/buttonsPerRow - 1 {
            tableNum = column + 10
        } else {
            tableNum = row * buttonsPerRow + column + 2
        }
        if tableNum >= 10 {
            tableNum -= 4
        }
        if tableNum >= 12 {
            tableNum -= 2 // Subtract 2 if the value is greater than 12
        }
    }
    
    func diffBtnTapped(_ diff: String) {
        selectedDifficulty = diff
        didDiffTapButton = true
    }
    
    func startGame() {
        if didTapButton && !selectedDifficulty.isEmpty {
            if selectedDifficulty == "Easy" {
                numOfQuestions = 5
            } else if selectedDifficulty == "Medium" {
                numOfQuestions = 10
            } else if selectedDifficulty == "Hard" {
                numOfQuestions = 20
            } else {
                isGameActive = false
                return
            }
            
            isGameActive = true
        } else {
            isGameActive = false
            showingAlert = true
        }
    }
    
    
}


struct BeautifulButton : ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 70, height: 70)
            .foregroundColor(.white)
        
        
        
    }
}

extension View {
    func styleBtn() -> some View {
        modifier(BeautifulButton())
    }
}

struct GameView: View {
    @Binding var isGameActive: Bool
    @Binding var numOfQuestions: Int
    @Binding var tableNum: Int
    
    @State var setOfNums: [Int] = []
    
    @State private var currentQuestionIndex = 0
    @State private var userScore = 0
    @State private var userAnswer = ""
    
    
    let gradientColors = [
        Color(red: 0.289, green: 0.561, blue: 1),
        Color(red: 0.190, green: 0.333, blue: 1)
        
    ]
    
    let animals = ["bear", "buffalo", "chick", "chicken", "cow", "crocodile", "dog", "duck", "elephant", "frog", "giraffe", "goat", "gorilla", "hippo", "horse", "monkey", "horse", "moose", "narwhal", "owl", "panda", "parrot", "penguin", "pig", "rabbit", "rhino", "sloth", "snake", "walrus", "whale", "zebra"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                VStack {
                    if currentQuestionIndex < setOfNums.count {
                        Text("Question \(currentQuestionIndex+1)/\(numOfQuestions)")
                    } else {
                        Text("Quiz completed!")
                        Text("You answered \(userScore)/\(numOfQuestions) questions correctly!")
                            .font(.title.bold())
                            .padding(40)
                        
                    }
                }
                .foregroundColor(.white)
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .textCase(.uppercase)
                .padding(20)
                
                Spacer()
                
                VStack {
                    
                    
                    let randomAnimal = animals.randomElement() ?? "sth crazy"
                    
                    if currentQuestionIndex < setOfNums.count {
                        HStack {
                            HStack {
                                Text("\(tableNum)")
                                    .foregroundColor(.blue)
                                Text("❌")
                                    .font(Font.system(size: 25))
                                Text("\(setOfNums[currentQuestionIndex])")
                                    .foregroundColor(.blue)
                                Image(randomAnimal)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text("=")
                                TextField("", text: $userAnswer)
                                    .frame(width: 70, height: 70)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                Image(randomAnimal)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                            
                        }
                    }
                }
                .foregroundColor(.red)
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .textCase(.uppercase)
                .padding(20)
                .onAppear {
                    generateSet()
                }
                .onSubmit {
                    submitAnswer()
                }
                .frame(
                    maxWidth: currentQuestionIndex < setOfNums.count ? .infinity : 0,
                    maxHeight: currentQuestionIndex < setOfNums.count  ? 100 : 0
                )
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
                VStack{
                    if currentQuestionIndex < setOfNums.count {
                        Button(action: submitAnswer) {
                            Text("Next")
                                .font(.title.bold())
                                .multilineTextAlignment(.center)
                                .textCase(.uppercase)
                                .foregroundColor(.blue)
                                .padding()
                        }
                        .background(Capsule().fill(Color.white))
                    } else {
                        Button(action: restartGame) {
                            Text("Restart")
                                .font(.title.bold())
                                .multilineTextAlignment(.center)
                                .textCase(.uppercase)
                                .foregroundColor(.blue)
                                .padding()
                        }
                        .background(Capsule().fill(Color.white))
                    }
                }
                
                Spacer()
            }
        }
    }
    
    func restartGame() {
        isGameActive = false
    }
    
    func submitAnswer() {
        let correctAnswer = tableNum * setOfNums[currentQuestionIndex]
        let userAnswerInt = Int(userAnswer)
        if userAnswerInt == correctAnswer {
            userScore += 1
        }
        userAnswer = ""
        currentQuestionIndex += 1
        
    }
    
    func generateSet() {
        setOfNums.removeAll()
        
        while setOfNums.count < numOfQuestions {
            let randomNum = Int.random(in: 1...12)
            
            setOfNums.append(randomNum)
        }
    }
}

struct ContentView: View {
    @State private var isGameActive = false
    @State private var numOfQuestions = 0
    @State private var tableNum = 0
    
    var body: some View {
        if(isGameActive) {
            GameView(isGameActive: $isGameActive, numOfQuestions: $numOfQuestions, tableNum: $tableNum)
        } else {
            SettingsView(isGameActive: $isGameActive, numOfQuestions: $numOfQuestions, tableNum: $tableNum)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

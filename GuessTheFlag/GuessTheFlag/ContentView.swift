//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Charlie Nguyen on 23/10/2020.
//

import SwiftUI


struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    
    @State private var rotationAmount = 0.0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        // Flag was tapped
                        self.flagTapped(number)
                    })
                    {
                        FlagImage(name: self.countries[number])
                    }
                    .rotation3DEffect(
                        .degrees(number == self.correctAnswer ? self.rotationAmount : 0),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                }
                
                
                Text("Your current score is \(userScore)")
                    .foregroundColor(.white)
                Spacer()
            }
        }
        
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
            withAnimation(.spring()) {
                self.rotationAmount += 360
            }
        } else {
            scoreTitle = "Wrong, that's the flag of \(countries[number])"
            if userScore == 0 {
                userScore = 0
            }
            
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  BetterRest
//
//  Created by Charlie Nguyen on 27/10/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 0
    
    let coffeeAmounts = [1, 2, 3, 4, 5, 6, 7 ,8 ,9, 10, 11, 12 ,13 ,14 ,15 ,16 ,17, 18, 19, 20]
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("When do you want to wake up?")
                            .font(.headline)) {
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                .textCase(nil)
                
                Section(header: Text("Desired amount of sleep")
                            .font(.headline)) {
                    
                    
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                .textCase(nil)
                
                Section(header: Text("Daily coffee intake")
                            .font(.headline)) {
                    
                    Picker("", selection: $coffeeAmount) {
                        ForEach(0 ..< coffeeAmounts.count ) {
                            Text("\(self.coffeeAmounts[$0]) cups")
                        }
                    }
                }
                .textCase(nil)
                
                Section(header: Text("Recommended sleep time")
                            .font(.headline)) {
                    Text(calculateBedtime())
                        .font(.largeTitle)
                }
                .textCase(nil)
            }
            .navigationBarTitle("BetterRest")
            
            
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func calculateBedtime() -> String {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try
                model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            
            return formatter.string(from: sleepTime)
        } catch {
            return "Sorry, there was a problem calculating your bedtime."
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

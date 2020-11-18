//
//  MainView.swift
//  Edutainment
//
//  Created by Charlie Nguyen on 17/11/2020.
//

import SwiftUI

class SettingsToggle: ObservableObject {
    @Published var isSettingsDisplayed = true
}

struct MainView: View {
    @ObservedObject var settings = Settings()
    @ObservedObject var settingsToggle = SettingsToggle()
    
    var body: some View {
            NavigationView {
                Group {
                    if settingsToggle.isSettingsDisplayed {
                        SettingsView(settings: settings, settingsToggle: settingsToggle)
                    } else {
                        GameView(settings: settings, settingsToggle: settingsToggle)
                    }
                }
                .navigationBarTitle("Multiplication")
            }
        }
    }

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().colorScheme(.dark)
    }
}

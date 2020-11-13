//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Charlie Nguyen on 26/10/2020.
//

import SwiftUI

struct FlagImage: View {
    var name: String
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(name: "UK")
    }
}

//
//  ActivityIndicator.swift
//  iMovies
//
//  Created by Charlie Nguyen on 19/11/2020.
//

import SwiftUI

struct ActivityIndicator: View {
    @State private var degrees = 0.0
    let color: Color
    let size: CGFloat
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.8)
            .stroke(color, lineWidth: 5.0)
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: degrees))
            .onAppear { self.start() }
    }
    
    func start() {
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            withAnimation {
                self.degrees += 10.0
            }
            if self.degrees == 360.0 {
                self.degrees = 0.0
            }
        }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator(color: Color.green, size: 80)
    }
}

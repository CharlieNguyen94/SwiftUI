//
//  Models.swift
//  TicTacToe
//
//  Created by Charlie Nguyen on 28/06/2021.
//

import Foundation

enum Player {
    case human, computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

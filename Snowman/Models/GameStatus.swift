//
//  GameStatus.swift
//  Snowman
//
//  Created by Maful on 08/06/23.
//

import SwiftUI

enum GameStatus {
    case won
    case lost
    case inProgress

    var displayStatus: Text {
        switch self {
        case .inProgress:
            return Text("In progress...")
        case .lost:
            let img = Image(systemName: "person.fill.turn.down")
            return Text("You lost \(img)")
        case .won:
            let img = Image(systemName: "heart.circle")
            return Text("You won! \(img)")
        }
    }

    var statusTextColor: Color {
        switch self {
        case .inProgress:
            return .primary
        case .lost:
            return .orange
        case .won:
            return .green
        }
    }
}

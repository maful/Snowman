//
//  GameStats.swift
//  Snowman
//
//  Created by Maful on 08/06/23.
//

import SwiftUI

struct GameStats: View {
    var games: [Game]

    var gameReport: String {
        let wonGames = games.filter {
            $0.gameStatus == .won
        }

        let lostGames = games.filter {
            $0.gameStatus == .lost
        }

        return """
        Games won: \(wonGames.count)
        Games lost: \(lostGames.count)
        """
    }

    var body: some View {
        Text(gameReport)
    }
}

struct GameStats_Previews: PreviewProvider {
    static var previews: some View {
        GameStats(games: [])
    }
}

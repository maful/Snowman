//
//  WordStats.swift
//  Snowman
//
//  Created by Maful on 08/06/23.
//

import SwiftUI

struct WordStats: View {
    var games: [Game]

    var wordCountReport: String {
        let completedGames = games.filter {
            $0.gameStatus != .inProgress
        }

        let gameReports = completedGames.map { game in
            let statusText = game.gameStatus == .won ? "won" : "lost"
            return "\(game.id): \(game.word.count) letters - \(statusText)"
        }

        return gameReports.joined(separator: "\n")
    }

    var body: some View {
        Text(wordCountReport)
    }
}

struct WordStats_Previews: PreviewProvider {
    static var previews: some View {
        WordStats(games: [])
    }
}

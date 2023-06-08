//
//  WordStats.swift
//  Snowman
//
//  Created by Maful on 08/06/23.
//

import Charts
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

    var wordStatsPoints: [ChartPoint] {
        let completedGames = games.filter {
            $0.gameStatus != .inProgress
        }

        let chartPoints = completedGames.map { game in
            ChartPoint(name: "#\(game.id)", value: game.word.count)
        }

        return chartPoints
    }

    var lineChartColor: Color {
        let wonGamesCount = games.filter {
            $0.gameStatus == .won
        }.count
        let lostGamesCount = games.filter {
            $0.gameStatus == .lost
        }.count

        if wonGamesCount > lostGamesCount {
            return .green
        } else if wonGamesCount < lostGamesCount {
            return .orange
        }

        return .blue
    }

    var body: some View {
        Chart {
            ForEach(wordStatsPoints) { point in
                LineMark(
                    x: .value("Game ID", point.name),
                    y: .value("Word Count", point.value)
                )
                .lineStyle(StrokeStyle(lineWidth: 4))
                .symbol(.diamond)
                .symbolSize(200)
                .foregroundStyle(lineChartColor)
                .accessibilityLabel("Game \(point.name)")
                .accessibilityValue("had \(point.value) letters in the word")
            }

            RuleMark(y: .value("Average", 7.5))
        }
        .chartYScale(domain: .automatic(includesZero: false))
        .frame(minWidth: 250, minHeight: 300)
        .padding()
    }
}

struct WordStats_Previews: PreviewProvider {
    static var previews: some View {
        WordStats(games: Game.sampleGames)
    }
}

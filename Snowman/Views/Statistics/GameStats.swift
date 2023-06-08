//
//  GameStats.swift
//  Snowman
//
//  Created by Maful on 08/06/23.
//

import SwiftUI
import Charts

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

    var gameStatsPoints: [ChartPoint] {
        let wonGames = games.filter {
            $0.gameStatus == .won
        }

        let lostGames = games.filter {
            $0.gameStatus == .lost
        }

        let chartPoints = [
            ChartPoint(name: "Wins", value: wonGames.count),
            ChartPoint(name: "Losses", value: lostGames.count)
        ]

        return chartPoints
    }

    var body: some View {
        Chart(gameStatsPoints) { point in
            BarMark(
                x: .value("Count", point.value),
                y: .value("Name", point.name)
            )
            .foregroundStyle(by: .value("Name", point.name))
            .annotation(
                position: .overlay,
                alignment: .leading,
                spacing: 20) {
                    Text("\(point.name): \(point.value)")
                        .font(.title2)
                }
        }
        .chartForegroundStyleScale([
            "Wins": Color.green.gradient,
            "Losses": Color.orange.gradient
        ])
        .chartLegend(.hidden)
        .frame(minWidth: 250, minHeight: 300)
        .padding()
        .shadow(radius: 5, x: 5, y: 5)
    }
}

struct GameStats_Previews: PreviewProvider {
    static var previews: some View {
        GameStats(games: Game.sampleGames)
    }
}

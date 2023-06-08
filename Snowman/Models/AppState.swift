//
//  AppState.swift
//  Snowman
//
//  Created by Maful on 08/06/23.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var games: [Game]
    @Published var gameIndex: Int
    @Published var selectedID: Int? {
        didSet {
            selectGame(id: selectedID)
        }
    }
    @Published var bossMode = false

    var gameHasStarted: Bool {
        !games[gameIndex].guesses.isEmpty
    }

    init() {
        let newGame = Game(id: 1)
        games = [newGame]

        gameIndex = 0
        selectedID = 1
    }

    func startNewGame() {
        let newGame = Game(id: games.count + 1)
        games.append(newGame)

        selectedID = newGame.id
        gameIndex = games.count - 1
    }

    func selectGame(id: Int?) {
        guard let id else {
            return
        }

        let gameLocation = games.firstIndex { game in
            game.id == id
        }

        if let gameLocation {
            gameIndex = gameLocation
        }
    }

    func getDifferentWord() {
        games[gameIndex].chooseNewWord()
    }
}

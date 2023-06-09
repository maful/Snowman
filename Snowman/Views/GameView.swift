//
//  GamView.swift
//  Snowman
//
//  Created by Maful on 07/06/23.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var appState: AppState
    @Environment(\.openWindow) var openWindow

    var game: Game {
        appState.games[appState.gameIndex]
    }

    var body: some View {
        HStack {
            Image("\(game.incorrectGuessCount)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 230)

            Spacer()

            VStack(spacing: 30.0) {
                Spacer()
                Text(game.statusText)
                    .font(.title2)
                    .foregroundColor(game.gameStatus.statusTextColor)

                LettersView(letters: game.letters)

                Spacer()

                HStack(spacing: 60) {
                    Button("Look Up Word") {
                        openWindow(value: game.word)
                    }
                    Button("New Game") {
                        appState.startNewGame()
                    }
                    .keyboardShortcut(.defaultAction)
                }
                .opacity(game.gameStatus == .inProgress ? 0 : 1)
                .disabled(game.gameStatus == .inProgress)

                Spacer()

                GuessesView(game: $appState.games[appState.gameIndex])
            }
            .padding()
            Spacer()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(appState: AppState())
    }
}

//
//  GuessesView.swift
//  Snowman
//
//  Created by Maful on 08/06/23.
//

import SwiftUI

struct GuessesView: View {
    @State var nextGuess = ""
    @Binding var game: Game
    @FocusState var entryFieldHasFocus: Bool

    var body: some View {
        VStack {
            HStack {
                Text("Letters used:")
                Text(game.guesses.joined(separator: ", "))
            }

            LabeledContent("Guess a letter:") {
                TextField("", text: $nextGuess)
                    .frame(width: 50)
                    .textFieldStyle(.roundedBorder)
                    .disabled(game.gameStatus != .inProgress)
                    .onChange(of: nextGuess) { newValue in
                        game.processGuess(letter: newValue)
                        nextGuess = ""
                    }
                    .focused($entryFieldHasFocus)
                    .onChange(of: game.id) { _ in
                        entryFieldHasFocus = true
                    }
                    .onAppear {
                        entryFieldHasFocus = true
                    }
            }
        }
    }
}

struct GuessesView_Previews: PreviewProvider {
    static var previews: some View {
        GuessesView(game: .constant(Game(id: 1)))
    }
}

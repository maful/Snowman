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

    var body: some View {
        VStack {
            HStack {
                Text("Letters used:")
                Text(game.guesses.joined(separator: ", "))
            }
        }
        .onAppear(perform: startMonitoringKeystrokes)
        .onChange(of: nextGuess) { _ in
            if game.gameStatus == .inProgress {
                game.processGuess(letter: nextGuess)
            }
            nextGuess = ""
        }
    }

    func startMonitoringKeystrokes() {
        NSEvent.addLocalMonitorForEvents(matching: .keyUp) { event in
            if event.modifierFlags.contains(.command) {
                return event
            }

            guard let key = event.characters(byApplyingModifiers: .shift) else {
                return event
            }

            if key >= "A" && key <= "Z" {
                nextGuess = key
            }

            return event
        }
    }
}

struct GuessesView_Previews: PreviewProvider {
    static var previews: some View {
        GuessesView(game: .constant(Game(id: 1)))
    }
}

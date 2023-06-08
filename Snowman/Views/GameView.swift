//
//  GamView.swift
//  Snowman
//
//  Created by Maful on 07/06/23.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        HStack {
            Image("0")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 230)

            Spacer()

            VStack(spacing: 30.0) {
                Spacer()
                Text("Enter a letter to guess the word.")
                    .font(.title2)

                LettersView()

                Spacer()
                Button("New Game") {
                    print("Starting new game.")
                }
                .keyboardShortcut(.defaultAction)
                Spacer()

                GuessesView()
            }
            .padding()
            Spacer()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

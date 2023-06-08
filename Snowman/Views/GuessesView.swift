//
//  GuessesView.swift
//  Snowman
//
//  Created by Maful on 08/06/23.
//

import SwiftUI

struct GuessesView: View {
    let guesses = ["E", "S", "R", "X"]

    var body: some View {
        VStack {
            HStack {
                Text("Letters used:")
                Text(guesses.joined(separator: ", "))
            }

            LabeledContent("Guess a letter:") {
                Text("Q")
            }
        }
    }
}

struct GuessesView_Previews: PreviewProvider {
    static var previews: some View {
        GuessesView()
    }
}

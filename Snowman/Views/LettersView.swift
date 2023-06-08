//
//  LettersView.swift
//  Snowman
//
//  Created by Maful on 08/06/23.
//

import SwiftUI

struct LettersView: View {
    let word = ["S", "N", "O", "W", "M", "A", "N"]

    var body: some View {
        HStack {
            ForEach(word, id: \.self) { letter in
                Text(letter)
                    .font(.title)
                    .bold()
                    .frame(width: 20, height: 20)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.accentColor)
                            .padding(2))
            }
        }
    }
}

struct LettersView_Previews: PreviewProvider {
    static var previews: some View {
        LettersView()
    }
}

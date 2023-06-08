//
//  StatsView.swift
//  Snowman
//
//  Created by Maful on 08/06/23.
//

import SwiftUI

struct StatsView: View {
    var games: [Game]
    var body: some View {
        TabView {
            GameStats(games: games)
                .tabItem {
                    Text("Games Won & Lost")
                }
            WordStats(games: games)
                .tabItem {
                    Text("Length of Words")
                }
        }
        .padding()
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(games: [])
    }
}

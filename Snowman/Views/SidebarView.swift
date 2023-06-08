//
//  SidebarView.swift
//  Snowman
//
//  Created by Maful on 07/06/23.
//

import SwiftUI

struct SidebarView: View {
    @ObservedObject var appState: AppState

    var body: some View {
        List(appState.games, selection: $appState.selectedID) { game in
            VStack(alignment: .leading) {
                Text("Game \(game.id)")
                    .font(.title3)
                Text(game.sidebarWord)
                game.gameStatus.displayStatus
            }
            .padding(.vertical)
            .foregroundColor(game.gameStatus.statusTextColor)
            .tag(game.id)
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView(appState: AppState())
    }
}

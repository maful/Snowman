//
//  ContentView.swift
//  Snowman
//
//  Created by Maful on 07/06/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var appState: AppState

    var body: some View {
        Group {
            if appState.bossMode {
                Color.white
                    .navigationTitle("Work")
            } else {
                NavigationSplitView {
                    SidebarView(appState: appState)
                } detail: {
                    GameView(appState: appState)
                }
            }
        }
        .frame(minWidth: 1100, minHeight: 500)
        .animation(.easeInOut, value: appState.bossMode)
        .toolbar(id: "content_view_toolbar") {
            ToolbarItem(id: "boss_mode_toolbar_item", placement: .automatic) {
                Button {
                    appState.bossMode.toggle()
                } label: {
                    Label("Boss", systemImage: "person.circle.fill")
                }
                .help("Quick, the boss is coming!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appState: AppState())
    }
}

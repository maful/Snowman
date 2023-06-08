//
//  SnowmanApp.swift
//  Snowman
//
//  Created by Maful on 07/06/23.
//

import SwiftUI

@main
struct SnowmanApp: App {
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}

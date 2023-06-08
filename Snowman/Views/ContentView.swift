//
//  ContentView.swift
//  Snowman
//
//  Created by Maful on 07/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            GameView()
        }
        .frame(minWidth: 850, minHeight: 500)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

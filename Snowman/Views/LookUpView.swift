//
//  LookUp.swift
//  Snowman
//
//  Created by Maful on 08/06/23.
//

import SwiftUI

struct LookUpView: View {
    let word: String
    @State var webViewIsLoading = true
    var body: some View {
        ZStack {
            WebView(word: word, isLoading: $webViewIsLoading)

            if webViewIsLoading {
                ProgressView()
            }
        }
        .navigationTitle(webViewIsLoading ? "Loading..." : word)
    }
}

struct LookUpView_Previews: PreviewProvider {
    static var previews: some View {
        LookUpView(word: "SNOWMAN")
    }
}

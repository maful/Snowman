//
//  WebView.swift
//  Snowman
//
//  Created by Maful on 08/06/23.
//

import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        let address = "https://www.dictionary.com/browse/\(word)"
        guard let url = URL(string: address) else {
            return
        }

        let request = URLRequest(url: url)
        nsView.load(request)
    }

    typealias NSViewType = WKWebView

    let word: String
    @Binding var isLoading: Bool

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print(error.localizedDescription)
            parent.isLoading = false
        }
    }
}

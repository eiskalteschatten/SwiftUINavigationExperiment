//
//  WindowView.swift
//  SwiftUINavigationExperiment
//
//  Created by Alex Seifert on 23.04.22.
//

import SwiftUI

struct WindowView: View {
    var text: String
    
    var body: some View {
        #if os(macOS)
        NavigationView {
            NavigationList(text: text)
            Text("Select something")
            Text("Select something else")
        }
        #else
        NavigationList(text: text)
        #endif
    }
}

fileprivate struct NavigationList: View {
    var text: String
    
    private enum Screen: Int {
        case test
    }
    
    @State private var screen: Screen?
    
    var body: some View {
        List {
            NavigationLink(
                destination: WindowSubView(text: text).navigationTitle("Test"),
                tag: Screen.test,
                selection: $screen,
                label: {
                    Label("Test", systemImage: "books.vertical")
                }
            )
        }
    }
}

struct WindowView_Previews: PreviewProvider {
    static var previews: some View {
        WindowView(text: "Preview")
    }
}

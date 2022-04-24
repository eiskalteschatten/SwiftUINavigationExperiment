//
//  WindowView.swift
//  SwiftUINavigationExperiment
//
//  Created by Alex Seifert on 23.04.22.
//

import SwiftUI

struct WindowView: View {
    var text: String
    
    private enum Screen: Int {
        case test
    }
    
    @State private var screen: Screen?
    
    var body: some View {
//        NavigationView {
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

            Text("Select something")
            
            Text("Select something else")
//        }
    }
}

struct WindowView_Previews: PreviewProvider {
    static var previews: some View {
        WindowView(text: "Preview")
    }
}

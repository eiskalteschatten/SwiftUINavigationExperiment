
//
//  WindowSubView.swift
//  SwiftUINavigationExperiment
//
//  Created by Alex Seifert on 24.04.22.
//

import SwiftUI

struct WindowSubView: View {
    var text: String
    
    private enum Screen: Int {
        case test
    }
    
    @State private var screen: Screen?
    
    var body: some View {
        List {
            NavigationLink(
                destination: Text(text).navigationTitle(text),
                tag: Screen.test,
                selection: $screen,
                label: {
                    Text("Test 2")
                }
            )
        }
    }
}

struct WindowSubView_Previews: PreviewProvider {
    static var previews: some View {
        WindowSubView(text: "Preview")
    }
}

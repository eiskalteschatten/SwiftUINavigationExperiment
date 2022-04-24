//
//  WindowType1View.swift
//  SwiftUINavigationExperiment
//
//  Created by Alex Seifert on 23.04.22.
//

import SwiftUI

struct WindowType1View: View {
    private enum Screen: Int {
        case test
    }
    
    @State private var screen: Screen?
    
    var body: some View {
//        NavigationView {
            List {
                NavigationLink(
                    destination: WindowSubView(text: "Window Type 1!").navigationTitle("Test"),
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

struct WindowType1View_Previews: PreviewProvider {
    static var previews: some View {
        WindowType1View()
    }
}

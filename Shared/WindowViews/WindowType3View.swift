//
//  WindowType3View.swift
//  SwiftUINavigationExperiment
//
//  Created by Alex Seifert on 23.04.22.
//

import SwiftUI

struct WindowType3View: View {
    private enum Screen: Int {
        case test
    }
    
    @State private var screen: Screen?
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: WindowSubView(text: "Window Type 3!"),
                    tag: Screen.test,
                    selection: $screen,
                    label: {
                        Label("Test", systemImage: "macwindow")
                    }
                )
            }

            Text("Select something")
            
            Text("Select something else")
        }
    }
}

struct WindowType3View_Previews: PreviewProvider {
    static var previews: some View {
        WindowType3View()
    }
}

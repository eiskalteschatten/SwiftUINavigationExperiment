//
//  ContentView.swift
//  Shared
//
//  Created by Alex Seifert on 23.04.22.
//

import SwiftUI

// TODO:
// - Generate the buttons and views dynamically from a data source

struct ContentView: View {
    #if os(iOS)
    private enum Screen: Int {
        case views, view1, view2, view3, view4
    }
    
    @State private var screen: Screen?
    #endif
    
    var body: some View {
        #if os(macOS)
            VStack(spacing: 15.0) {
                Button("Open Window Type 1", action: {
                    let window = WindowManager()
                    window.openWindow(contentView: WindowView(text: "Window Type 1"), title: "Window Type 1", autosaveName: "WindowType1")
                })
                
                Button("Open Window Type 2", action: {
                    let window = WindowManager()
                    window.openWindow(contentView: WindowView(text: "Window Type 2"), title: "Window Type 2", autosaveName: "WindowType2")
                })
                
                Button("Open Window Type 3", action: {
                    let window = WindowManager()
                    window.openWindow(contentView: WindowView(text: "Window Type 3"), title: "Window Type 3", autosaveName: "WindowType3")
                })
                
                Button("Open Window Type 4", action: {
                    let window = WindowManager()
                    window.openWindow(contentView: WindowView(text: "Window Type 4"), title: "Window Type 4", autosaveName: "WindowType4")
                })
            }
            .padding()
            .frame(minWidth: 200)
        #else
        NavigationView {
            VStack(spacing: 15.0) {
                NavigationLink(
                    destination: WindowView(text: "Window Type 1").navigationTitle("Window Type 1"),
                    tag: Screen.view1,
                    selection: $screen,
                    label: {
                        Text("Window Type 1")
                    }
                )
                
                NavigationLink(
                    destination: WindowView(text: "Window Type 2").navigationTitle("Window Type 2"),
                    tag: Screen.view2,
                    selection: $screen,
                    label: {
                        Text("Window Type 2")
                    }
                )
                
                NavigationLink(
                    destination: WindowView(text: "Window Type 3").navigationTitle("Window Type 3"),
                    tag: Screen.view3,
                    selection: $screen,
                    label: {
                        Text("Window Type 3")
                    }
                )
                
                NavigationLink(
                    destination: WindowView(text: "Window Type 4").navigationTitle("Window Type 4"),
                    tag: Screen.view4,
                    selection: $screen,
                    label: {
                        Text("Window Type 4")
                    }
                )
            }
        }
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

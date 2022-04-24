//
//  ContentView.swift
//  Shared
//
//  Created by Alex Seifert on 23.04.22.
//

import SwiftUI

struct ContentView: View {
    #if os(iOS)
    private enum Screen: Int {
        case views, view
    }
    
    @State private var screen: Screen?
    #endif
    
    var body: some View {
        #if os(macOS)
            VStack(spacing: 15.0) {
                Button("Open Window Type 1", action: {
                    // TODO:
                    // - macOS: open the view in a new window
                    // - iOS: replace the ContentView
                    // - Generate the buttons and views dynamically from a data source
                    
                    #if os(macOS)
                    let window = WindowManager()
                    window.openWindow(contentView: WindowType1View(), title: "Window Type 1", autosaveName: "WindowType1")
                    #else
                    
                    #endif
                })
                
                Button("Open Window Type 2", action: {
                    #if os(macOS)
                    let window = WindowManager()
                    window.openWindow(contentView: WindowType2View(), title: "Window Type 2", autosaveName: "WindowType2")
                    #endif
                })
                
                Button("Open Window Type 3", action: {
                    #if os(macOS)
                    let window = WindowManager()
                    window.openWindow(contentView: WindowType3View(), title: "Window Type 3", autosaveName: "WindowType3")
                    #endif
                })
                
                Button("Open Window Type 4", action: {
                    #if os(macOS)
                    let window = WindowManager()
                    window.openWindow(contentView: WindowType4View(), title: "Window Type 4", autosaveName: "WindowType4")
                    #endif
                })
            }
            .padding()
            .frame(minWidth: 200)
        #else
        NavigationView {
            VStack(spacing: 15.0) {
                NavigationLink(
                    destination: WindowType1View().navigationTitle("Window Type 1"),
                    tag: Screen.view,
                    selection: $screen,
                    label: {
                        Text("Window Type 1")
                    }
                )
                
                NavigationLink(
                    destination: WindowType2View().navigationTitle("Window Type 2"),
                    tag: Screen.view,
                    selection: $screen,
                    label: {
                        Text("Window Type 2")
                    }
                )
                
                NavigationLink(
                    destination: WindowType3View().navigationTitle("Window Type 3"),
                    tag: Screen.view,
                    selection: $screen,
                    label: {
                        Text("Window Type 3")
                    }
                )
                
                NavigationLink(
                    destination: WindowType4View().navigationTitle("Window Type 4"),
                    tag: Screen.view,
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

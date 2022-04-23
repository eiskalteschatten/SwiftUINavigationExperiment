//
//  ContentView.swift
//  Shared
//
//  Created by Alex Seifert on 23.04.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 15.0) {
            Button("Open Window Type 1", action: {
                // TODO:
                // - macOS: open the view in a new window
                // - iPadOS: open the tabview and open the correct view in a new tab
                // - iOS: figure out the best means of navigation
                
                #if os(macOS)
                let window = WindowManager()
                window.openWindow(contentView: WindowType1View(), title: "Window Type 1", autosaveName: "WindowType1")
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

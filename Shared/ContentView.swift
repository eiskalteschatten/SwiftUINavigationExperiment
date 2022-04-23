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
                // TODO: open the window on macOS; open the tabview on iOS and open the correct view in a new tab
            })
            
            Button("Open Window Type 2", action: {
                // TODO: open the window on macOS; open the tabview on iOS and open the correct view in a new tab
            })
            
            Button("Open Window Type 3", action: {
                // TODO: open the window on macOS; open the tabview on iOS and open the correct view in a new tab
            })
            
            Button("Open Window Type 4", action: {
                // TODO: open the window on macOS; open the tabview on iOS and open the correct view in a new tab
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

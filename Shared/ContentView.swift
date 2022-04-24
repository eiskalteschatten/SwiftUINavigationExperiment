//
//  ContentView.swift
//  Shared
//
//  Created by Alex Seifert on 23.04.22.
//

import SwiftUI

// TODO: animate the opening of a view on iOS

struct ContentView: View {
    #if os(iOS)
    @State private var item: DataModel?
    #endif
    
    let dataItems = getData()
    
    var body: some View {
        #if os(macOS)
            VStack(spacing: 15.0) {
                ForEach(dataItems, id: \.self) { item in
                    Button(item.title, action: {
                        let window = WindowManager()
                        window.openWindow(contentView: WindowView(text: item.title), title: item.title, autosaveName: "WindowType\(item.id)")
                    })
                }
            }
            .padding()
            .frame(minWidth: 200)
        #else
        if item != nil {
            WindowView(item: $item).navigationTitle(item?.title ?? "")
        }
        else {
            VStack(spacing: 15.0) {
                ForEach(dataItems, id: \.self) { dataItem in
                    Button(dataItem.title, action: {
                        item = dataItem
                    })
                }
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

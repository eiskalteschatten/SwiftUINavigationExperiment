//
//  ContentView.swift
//  Shared
//
//  Created by Alex Seifert on 23.04.22.
//

import SwiftUI

struct ContentView: View {
    @State private var item: DataModel?
    let dataItems = getData()
    
    var body: some View {
        #if os(macOS)
            VStack(spacing: 15.0) {
                ForEach(dataItems, id: \.self) { dataItem in
                    Button(dataItem.title, action: {
                        item = dataItem
                        let window = WindowManager()
                        window.openWindow(contentView: WindowView(item: $item), title: dataItem.title, autosaveName: "WindowType\(dataItem.id)")
                    })
                }
            }
            .padding()
            .frame(minWidth: 200)
        #else
        if item != nil {
            WindowView(item: $item).navigationTitle(item?.title ?? "")
                .transition(.scale)
        }
        else {
            VStack(spacing: 15.0) {
                ForEach(dataItems, id: \.self) { dataItem in
                    Button(dataItem.title, action: {
                        withAnimation {
                            item = dataItem
                        }
                    })
                }
            }
            .transition(.scale)
        }
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

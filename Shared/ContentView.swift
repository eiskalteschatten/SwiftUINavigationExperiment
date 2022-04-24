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
                    })
                }
            }
            .onChange(of: item) { selectedItem in
                if let unwrappedItem = selectedItem {
                    let window = WindowManager()
                    window.openWindow(contentView: WindowView(item: $item), title: unwrappedItem.title, autosaveName: "WindowType\(unwrappedItem.id)")
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

//
//  ContentView.swift
//  Shared
//
//  Created by Alex Seifert on 23.04.22.
//

import SwiftUI

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
        if let unwrappedItem = item {
            WindowView(text: unwrappedItem.title).navigationTitle(unwrappedItem.title)
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
        
//        NavigationView {
//            VStack(spacing: 15.0) {
//                ForEach(dataItems, id: \.self) { item in
//                    NavigationLink(
//                        destination: WindowView(text: item.title).navigationTitle(item.title),
//                        tag: item.id,
//                        selection: $screen,
//                        label: {
//                            Text(item.title)
//                        }
//                    )
//                }
//            }
//        }
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

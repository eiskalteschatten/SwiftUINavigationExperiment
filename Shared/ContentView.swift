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
        VStack(alignment: .leading, spacing: 5) {
            Title()
            
            ScrollView {
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
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 200, maxHeight: .infinity, alignment: .topLeading)
        
        #else
        if item != nil {
            WindowView(item: $item).navigationTitle(item?.title ?? "")
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        }
        else {
            VStack(alignment: .leading, spacing: 5) {
                Title()
                
                ScrollView {
                    VStack(alignment: .center, spacing: 15.0) {
                        ForEach(dataItems, id: \.self) { dataItem in
                            Button(dataItem.title, action: {
                                withAnimation {
                                    item = dataItem
                                }
                            })
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .padding()
            .transition(.slide)
            .frame(maxWidth: .infinity, minHeight: 200, maxHeight: .infinity, alignment: .topLeading)
        }
        #endif
    }
}

fileprivate struct Title: View {
    var body: some View {
        Text("Objects")
            .font(Font.largeTitle.bold())
            .padding(.top)
            .padding(.leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

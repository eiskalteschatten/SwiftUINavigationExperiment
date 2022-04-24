//
//  WindowView.swift
//  SwiftUINavigationExperiment
//
//  Created by Alex Seifert on 23.04.22.
//

import SwiftUI

struct WindowView: View {
    @Binding var item: DataModel?
    
    private enum Screen: Int {
        case test
    }
    
    @State private var screen: Screen?
    
    var body: some View {
        if let unwrappedItem = item {
            NavigationView {
                List {
                    NavigationLink(
                        destination: WindowSubView(text: unwrappedItem.title).navigationTitle("Test"),
                        tag: Screen.test,
                        selection: $screen,
                        label: {
                            Label("Test", systemImage: "books.vertical")
                        }
                    )
                }
                #if os(iOS)
                .navigationBarTitle(unwrappedItem.title)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            withAnimation {
                                item = nil
                            }
                        } label: {
                            HStack(spacing: 5) {
                                Image(systemName: "chevron.left")
                                    .font(Font.system(size: 17, weight: .semibold))
                                Text("All Views")
                            }
                        }
                    }
                }
                #endif
                
                Text("Select something")
                Text("Select something else")
            }
        }
    }
}

struct WindowView_Previews: PreviewProvider {
    @State static var item: DataModel? = DataModel(id: 1, title: "Preview")
    
    static var previews: some View {
        WindowView(item: $item)
    }
}

//
//  WindowType1.swift
//  SwiftUINavigationExperiment (macOS)
//
//  Created by Alex Seifert on 23.04.22.
//

import Cocoa
import SwiftUI

class WindowType1Manager {
    var window: NSWindow?
    
    func openWindow() {
        let contentView = WindowType1View()
        
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 450, height: 550),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )

        window!.center()
        window!.setFrameAutosaveName("WindowType1")
        window!.title = "Window Type 1"
        window!.isReleasedWhenClosed = false

        window!.contentView = NSHostingView(rootView: contentView)
        window!.makeKeyAndOrderFront(nil)
    }
}


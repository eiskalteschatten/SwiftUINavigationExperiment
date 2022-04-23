//
//  WindowManager.swift
//  SwiftUINavigationExperiment (macOS)
//
//  Created by Alex Seifert on 23.04.22.
//

import Cocoa
import SwiftUI

class WindowManager {
    var window: NSWindow?
    
    func openWindow<Content: View>(contentView: Content, title: String, autosaveName: String) {
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 450, height: 550),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )

        window!.center()
        window!.setFrameAutosaveName(autosaveName)
        window!.title = title
        window!.isReleasedWhenClosed = false

        window!.contentView = NSHostingView(rootView: contentView)
        window!.makeKeyAndOrderFront(nil)
    }
}


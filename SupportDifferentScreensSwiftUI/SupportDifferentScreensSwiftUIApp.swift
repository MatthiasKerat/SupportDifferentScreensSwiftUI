//
//  SupportDifferentScreensSwiftUIApp.swift
//  SupportDifferentScreensSwiftUI
//
//  Created by Matthias Kerat on 25.09.22.
//

import SwiftUI

@main
struct SupportDifferentScreensSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ResponsiveView {properties in
                ContentView(layoutProperties: properties)
            }
            .navigationViewStyle(.stack)
        }
    }
}

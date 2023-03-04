//
//  TodoApp.swift
//  Todo
//
//  Created by Howard Thomas on 3/4/23.
//

import SwiftUI

@main
struct TodoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataModel())
        }
    }
}

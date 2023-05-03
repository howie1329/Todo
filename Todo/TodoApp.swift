//
//  TodoApp.swift
//  Todo
//
//  Created by Howard Thomas on 3/4/23.
//

import SwiftUI

@main
struct TodoApp: App {
    @StateObject var dm = DataModel()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(dm)
                .preferredColorScheme(.dark)
        }
    }
}

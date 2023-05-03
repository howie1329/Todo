//
//  TabView.swift
//  Todo
//
//  Created by Howard Thomas on 5/3/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            MainView()
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Todo")
                }
            NotesMainView()
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Notes")
                }
            
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

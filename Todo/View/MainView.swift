//
//  ContentView.swift
//  Todo
//
//  Created by Howard Thomas on 3/4/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var dm:DataModel
    
    
    @State var showAddView = false
    
    @State var currentTodo:TodoEntity? = nil
    @State var presentationDetents = PresentationDetent.medium
    
    var body: some View {
        NavigationView{
            VStack {
                MainViewList()
            }
            .navigationBarTitle("Todo List")
            .sheet(isPresented: $showAddView, content: {
                AddTodoView(showView:$showAddView)
                    .presentationDetents([.medium, .large], selection: $presentationDetents)
            })
            .toolbar{
                HStack{
                    Button {
                        showAddView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(DataModel())
    }
}

//
//  ContentView.swift
//  Todo
//
//  Created by Howard Thomas on 3/4/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var model:DataModel
    
    @State var searchBar = ""
    @State var showAddView = false
    @State var presentationDetents = PresentationDetent.medium
    
    var body: some View {
        NavigationView{
            VStack {
                List {
                    ForEach(model.todoList){ item in
                        if item.name.contains(searchBar){
                            TodoRowView(item: item)
                        } else if searchBar == ""{
                            TodoRowView(item: item)
                        }
                    }
                }
                .searchable(text: $searchBar)
                
            }
            .navigationBarTitle("Todo List")
            .sheet(isPresented: $showAddView, content: {
                AddTodoView(showView:$showAddView)
                    .presentationDetents([.medium], selection: $presentationDetents)
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

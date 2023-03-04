//
//  ContentView.swift
//  Todo
//
//  Created by Howard Thomas on 3/4/23.
//

import SwiftUI

struct ContentView: View {
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
                            HStack(spacing:20){
                                Spacer()
                                Text(item.name)
                                Text(item.body)
                                Spacer()
                            }
                            .swipeActions {
                                Button(role:.destructive) {
                                    model.todoList.removeAll { Todo in
                                        Todo.id == item.id
                                    }
                                    print(model.todoList)
                                } label: {
                                    Image(systemName: "trash.circle.fill")
                                }
                                
                            }
                        } else if searchBar == ""{
                            HStack(spacing:20){
                                Spacer()
                                Text(item.name)
                                Text(item.body)
                                Spacer()
                            }
                            .swipeActions {
                                Button(role:.destructive) {
                                    model.todoList.removeAll { Todo in
                                        Todo.id == item.id
                                    }
                                    print(model.todoList)
                                } label: {
                                    Image(systemName: "trash.circle.fill")
                                }
                                
                            }
                        }
                    }
                }
                .searchable(text: $searchBar)
                
            }
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
        ContentView()
            .environmentObject(DataModel())
    }
}

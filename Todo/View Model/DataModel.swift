//
//  DataModel.swift
//  Todo
//
//  Created by Howard Thomas on 3/4/23.
//

import Foundation

class DataModel: ObservableObject {
    
    @Published var todoList: [Todo] = []
    
    init(){
        createTodo(name: "First Todo", body: "HomeWork")
        createTodo(name: "Second Todo", body: "Clean Room")
    }
    
    func createTodo(name:String, body:String){
        
        self.todoList.append(Todo(id: UUID(), name: name, body: body))
    }
}

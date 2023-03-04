//
//  Todo.swift
//  Todo
//
//  Created by Howard Thomas on 3/4/23.
//

import Foundation

class Todo: Identifiable, ObservableObject{
    
    init(name:String, body:String){
        self.id = UUID()
        self.name = name
        self.body = body
        self.completed = false
    }
    
    
    var id:UUID
    var name:String
    var body:String
    var completed:Bool
}

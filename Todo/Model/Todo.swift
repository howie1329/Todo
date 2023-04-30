//
//  Todo.swift
//  Todo
//
//  Created by Howard Thomas on 3/4/23.
//

import Foundation

class Todo: Identifiable, ObservableObject{
    
    init(name:String, body:String, date:Date){
        self.id = UUID()
        self.name = name
        self.body = body
        self.completed = false
        self.dueDate = date
    }
    
    
    var id:UUID
    var name:String
    var body:String
    var completed:Bool
    var dueDate:Date
}

//
//  DataModel.swift
//  Todo
//
//  Created by Howard Thomas on 3/4/23.
//

import CoreData
import Foundation

class DataModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [TodoEntity] = []
    
    
    init(){
        container = NSPersistentContainer(name: "TodoContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading core data \(error)")
            }
            
        }
        fetchTodos()
    }
    
    func fetchTodos(){
        let request = NSFetchRequest<TodoEntity>(entityName: "TodoEntity")
        
        do{
           savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error Fetching... \(error)")
        }
        
    }
    
    func addTodo(Todos: Todo){
        let newTodo = TodoEntity(context: container.viewContext)
        newTodo.id = UUID()
        newTodo.isCompleted = Todos.completed
        newTodo.title = Todos.name
        newTodo.body = Todos.body
        newTodo.date = Todos.dueDate
        saveData()
    }
    
    func deleteFruit(indexSet: IndexSet){
       guard let index = indexSet.first else {return}
        let entiy = savedEntities[index]
        container.viewContext.delete(entiy)
        saveData()
    }
    
    func updateTodo(entity: TodoEntity){
        entity.isCompleted.toggle()
        saveData()
        
    }
    
    func saveData(){
        do{
            try container.viewContext.save()
            fetchTodos()
        } catch let error{
            print("Error Saving \(error)")
        }
    }
}

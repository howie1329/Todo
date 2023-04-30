//
//  DataModel.swift
//  Todo
//
//  Created by Howard Thomas on 3/4/23.
//

import CoreData
import Foundation

enum CalanderErrors: Error {
    case noConvertMonth
    case noConvertDay
}

let monthArr = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]

class DataModel: ObservableObject {
    
   
    
    let container: NSPersistentContainer
    @Published var savedEntities: [TodoEntity] = []
    var currentDate = Date.now
    @Published var currentMonth: Int
    @Published var currentDay: Int
    
    
    init(){
        container = NSPersistentContainer(name: "TodoContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading core data \(error)")
            }
            
        }
        currentMonth = Calendar.current.dateComponents([.month], from: currentDate).month ?? 0
        currentDay = Calendar.current.dateComponents([.day], from: currentDate).day ?? 0
        fetchTodos()
    }
    
    func convertDateToMonthNumber(inputDate:Date)throws -> Int{
        
        let monthNumber = Calendar.current.dateComponents([.month], from: inputDate)
        
        if let number = monthNumber.month{
            return number
        }else{
            throw CalanderErrors.noConvertMonth
        }
    }
    
    func convertDateToDayNumber(inputDate:Date) throws -> Int {
        let dayNumber = Calendar.current.dateComponents([.day], from: inputDate)
        
        if let number = dayNumber.day{
            return number
        }else{
            throw CalanderErrors.noConvertDay
        }
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
        
        do{
            newTodo.monthNumber = Int64(try convertDateToMonthNumber(inputDate: Todos.dueDate))
            newTodo.dayNumber = Int64(try convertDateToDayNumber(inputDate: Todos.dueDate))
        } catch{
            print("Error Converting Month \(error)")
        }
       
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

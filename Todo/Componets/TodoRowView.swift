//
//  TodoRowView.swift
//  Todo
//
//  Created by Howard Thomas on 3/4/23.
//

import SwiftUI

struct TodoRowView: View {
    @EnvironmentObject var model:DataModel
    var item:Todo
    var body: some View {
        HStack(spacing:20){
            Spacer()
            if item.completed{
                Text(item.name)
                    .strikethrough()
                Text(item.body)
                    .strikethrough()
                ForEach(item.details, id:\.self){
                    Text($0.capitalized)
                }
            }else{
                Text(item.name)
                Text(item.body)
                ForEach(item.details, id:\.self){
                    Text($0.capitalized)
                }
            }
            Spacer()
        }
        .swipeActions(edge:.leading){
            Button {
                
                if let idNum = model.todoList.firstIndex(where: {$0.id == item.id}){
                    
                    model.todoList[idNum].completed.toggle()
                    model.refreshList()
                }
            } label: {
                Image(systemName: "checkmark.circle")
            }
            .tint(.green)

        }
        .swipeActions(edge:.trailing) {
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

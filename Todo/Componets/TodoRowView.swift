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
            }else{
                Text(item.name)
                Text(item.body)
            }
            Spacer()
        }
        .swipeActions(edge:.leading){
            Button {
                
                if let idNum = model.todoList.firstIndex(where: {$0.id == item.id}){
                    
                    model.todoList[idNum].completed = true
                }
            } label: {
                Image(systemName: "checkmark.circle")
            }

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

//
//  TodoDetail.swift
//  Todo
//
//  Created by Howard Thomas on 4/28/23.
//

import SwiftUI

struct TodoDetail: View {
    var todoItem: TodoEntity
    var body: some View {
        VStack{
            if todoItem.isCompleted{
                Text("Completed")
                    .foregroundColor(.green)
                    .bold()
            }else{
                Text("Not Completed")
                    .foregroundColor(.red)
                    .bold()
            }
            VStack{
                Text(todoItem.title  ?? "Unknown")
                if let dueDate = todoItem.date{
                    Text("Due Date: \(dueDate)")
                }
                if let details = todoItem.body{
                    Text(details)
                }
            }
        }
    }
}

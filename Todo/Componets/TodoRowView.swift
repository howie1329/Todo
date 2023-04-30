//
//  TodoRowView.swift
//  Todo
//
//  Created by Howard Thomas on 3/4/23.
//

import SwiftUI

struct TodoRowView: View {
    @EnvironmentObject var dm:DataModel
    var item:TodoEntity
    var body: some View {
        HStack(){
            switch item.priority{
            case todoPriority.low.rawValue:
                Image(systemName: "exclamationmark")
                    .foregroundColor(.yellow)
            case todoPriority.normal.rawValue:
                Image(systemName: "exclamationmark.2")
                    .foregroundColor(.orange)
            case todoPriority.high.rawValue:
                Image(systemName: "exclamationmark.3")
                    .foregroundColor(.red)
            default:
                Image(systemName: "exclamationmark")
            }
            Spacer()
            VStack{
                Text(item.title ?? "Unknown")
                    .bold()
                if let todoDate = item.date {
                    Text("Due Date: \(todoDate.formatted(date: .numeric, time: .shortened))")
                }
                if item.body != ""{
                    Text(item.body ?? "No Details")
                }
            }
            Spacer()
            VStack(alignment:.center){
                if item.isCompleted{
                    Button {
                        dm.updateTodo(entity: item)
                    } label: {
                        Image(systemName: "circle.fill")
                            .foregroundColor(.green)
                    }
                } else{
                    Button {
                        dm.updateTodo(entity: item)
                    } label: {
                        Image(systemName: "circle")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

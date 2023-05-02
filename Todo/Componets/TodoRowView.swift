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
    @State var editView = false
    var body: some View {
        VStack(alignment:.center){
            HStack{
                Button {
                    editView.toggle()
                } label: {
                    Image(systemName: "pencil")
                        .frame(width:15)
                        .clipped()
                }
                .buttonStyle(.bordered)
                Spacer()
                VStack{
                    HStack(spacing:10){
                        Text(item.title ?? "Unknown")
                            .bold()
                            .frame(width:100)
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
                    }
                    if let todoDate = item.date {
                        Text("Due Date: \(todoDate.formatted(date: .numeric, time: .omitted))")
                    }
                    if item.body != ""{
                        Text(item.body ?? "No Details")
                    }
                }
                
                Spacer()
                VStack{
                    if item.isCompleted{
                        Button {
                            dm.toggleComplete(entity: item)
                        } label: {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.green)
                        }
                    } else{
                        Button {
                            dm.toggleComplete(entity: item)
                        } label: {
                            Image(systemName: "circle")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .sheet(isPresented: $editView) {
            EditTodoView(item: item, editView: $editView)
                .presentationDetents([.medium])
        }
    }
}

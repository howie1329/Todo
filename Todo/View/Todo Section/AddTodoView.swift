//
//  AddTodoView.swift
//  Todo
//
//  Created by Howard Thomas on 3/4/23.
//

import SwiftUI

struct AddTodoView: View {
    @EnvironmentObject var dm:DataModel
    
    @State var name = ""
    @State var todoBody = ""
    @State var dueDate = Date.now
    
    @Binding var showView:Bool
    @State var showDetail = false
    @State var numDetail = 0
    
    @State var priority = todoPriority.normal
    
    var body: some View {
        VStack{
            Text("Create New Todo")
            Form{
                TextField("Name", text: $name)
                Picker("Priority", selection: $priority) {
                    ForEach(todoPriority.allCases, id:\.rawValue){item in
                        Text("\(item.rawValue)").tag(item)
                    }
                }
                .pickerStyle(.segmented)
                
                DatePicker("dueDate",selection: $dueDate)
                
                Toggle("Todo Details", isOn: $showDetail)
                if showDetail{
                    Section{
                        TextEditor(text: $todoBody)
                    }header: {
                        Text("Todo Body Info")
                    }
                    
                }
            }
            .frame(height: 300)
            Button {
                dm.addTodo(Todos: Todo(name: name, body: todoBody, date: dueDate, priority: priority))
                showView.toggle()
            } label: {
                Text("Add Todo")
            }
            Spacer()
        }
        .padding() 
    }
}


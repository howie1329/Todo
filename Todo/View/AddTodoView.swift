//
//  AddTodoView.swift
//  Todo
//
//  Created by Howard Thomas on 3/4/23.
//

import SwiftUI

struct AddTodoView: View {
    @EnvironmentObject var model:DataModel
    
    @State var name = ""
    @State var todoBody = ""
    
    @Binding var showView:Bool
    
    var body: some View {
        VStack{
            Text("Create New Todo")
            Form{
                TextField("Name", text: $name)
                Section{
                    TextEditor(text: $todoBody)
                }header: {
                    Text("Todo Body Info")
                }
            }
            .frame(height: 300)
            Button {
                model.createTodo(name: name, body: todoBody)
                showView.toggle()
            } label: {
                Text("Add Todo")
            }
            Spacer()
        }
        .padding()
    }
}


//
//  EditTodoView.swift
//  Todo
//
//  Created by Howard Thomas on 5/1/23.
//

import SwiftUI

struct EditTodoView: View {
    @EnvironmentObject var dm:DataModel
    
    var item:TodoEntity
    @State var title = ""
    @State var todoBody = ""
    @Binding var editView:Bool
    
    var body: some View {
        VStack{
            Text("Edit Todo")
                .font(.title)
                .bold()
            TextField("Title", text: $title)
            TextField("Body",text:$todoBody)
            Button {
                dm.updateTodo(entity: item, title: title, body: todoBody)
                editView = false
            } label: {
                Text("Update")
            }
            .buttonStyle(.borderedProminent)

        }
        .onAppear {
            if let oldTitle = item.title, let oldBody = item.body{
                self.title = oldTitle
                self.todoBody = oldBody
            }
            
        }
        .padding()
    }
}

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
    @State var details: [String] = []
    
    @Binding var showView:Bool
    @State var showDetail = false
    @State var numDetail = 0
    
    var body: some View {
        VStack{
            Text("Create New Todo")
            Form{
                TextField("Name", text: $name)
                Toggle("Todo Details", isOn: $showDetail)
                if showDetail{
                    Section{
                        TextEditor(text: $todoBody)
                    }header: {
                        Text("Todo Body Info")
                    }
                    Text("Here")
                        .onTapGesture {
                            details.append("")
                        }
                    List{
                        ForEach($details,id: \.self){
                            TextEditor(text: $0)
                        }
                    }
                    
                }
                Button {
                    numDetail += 1
                } label: {
                    Text("Add More Detials")
                }

                
            }
            .frame(height: 300)
            Button {
                model.createTodo(name: name, body: todoBody, detail: details)
                showView.toggle()
            } label: {
                Text("Add Todo")
            }
            Spacer()
        }
        .padding() 
    }
}


//
//  ContentView.swift
//  Todo
//
//  Created by Howard Thomas on 3/4/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var dm:DataModel
    
    @State var showAddView = false
    @State var monthlyView = false
    @State var currentTodo:TodoEntity? = nil
    @State var presentationDetents = PresentationDetent.medium
    
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    if monthlyView {
                        Stepper("\(monthArr[dm.currentMonth - 1])", value: $dm.currentMonth, in: 1...12)
                    }
                }
                MainViewList(monthlyView:monthlyView)
                    
            }
            .navigationBarTitle("Todo List")
            .sheet(isPresented: $showAddView, content: {
                AddTodoView(showView:$showAddView)
                    .presentationDetents([.medium, .large], selection: $presentationDetents)
            })
            .toolbar{
                HStack{
                    Button {
                        monthlyView.toggle()
                    } label: {
                        Text("MV")
                    }.buttonStyle(.borderedProminent)
                    
                    Button {
                        showAddView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(DataModel())
    }
}

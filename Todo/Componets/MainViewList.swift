//
//  MainViewList.swift
//  Todo
//
//  Created by Howard Thomas on 4/29/23.
//

import SwiftUI

struct MainViewList: View {
    @EnvironmentObject var dm:DataModel
    var monthlyView:Bool
    @State var searchBar = ""
    var body: some View {
        List {
            ForEach(dm.savedEntities){item in
                
                if monthlyView{
                    if item.monthNumber == dm.currentMonth{
                        if searchBar == ""{
                            TodoRowView( item: item)
                        }else if item.title!.contains(searchBar){
                            TodoRowView(item: item)
                        }
                    }
                } else{
                    if searchBar == ""{
                        TodoRowView( item: item)
                    }else if item.title!.contains(searchBar){
                        TodoRowView(item: item)
                    }
                }
            }
            .onDelete(perform: dm.deleteFruit)
        }
        .searchable(text: $searchBar)
    }
}


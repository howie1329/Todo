//
//  AddNewNoteView.swift
//  Todo
//
//  Created by Howard Thomas on 5/3/23.
//

import SwiftUI

struct AddNewNoteView: View {
    @EnvironmentObject var dm:DataModel
    @Binding var newNoteViewStatus:Bool
    
    @State var title = ""
    @State var noteBody = ""
    var body: some View {
        VStack{
            HStack{
                Button {
                    dm.createNote(Note(id: UUID(), title: title, body: noteBody, date: Date.now))
                    newNoteViewStatus = false
                } label: {
                    Image(systemName: "checkmark.circle")
                }
                .buttonStyle(.borderedProminent)
            }
            TextField("title", text: $title)
            TextEditor(text: $noteBody)
        }
        .padding()
    }
}

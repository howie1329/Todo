//
//  NoteDetailView.swift
//  Todo
//
//  Created by Howard Thomas on 5/3/23.
//

import SwiftUI

struct NoteDetailView: View {
    @EnvironmentObject var dm:DataModel
    var noteItem:NotesEntity
    @State var bodyNote:String
    @State var editStatus = false
    var body: some View {
        VStack{
            if let noteBody = noteItem.body{
                if editStatus{
                    TextField("Test", text: $bodyNote)
                }else{
                    Text(getAttributedString(_:noteBody))
                }
            }
            
            Spacer()
        }
        .frame(maxWidth:.infinity,alignment: .leading)
        .padding()
        .toolbar(content: {
            if editStatus{
                Button {
                    dm.updateNotes(entity: noteItem, body: bodyNote)
                    editStatus.toggle()
                } label: {
                    Image(systemName: "checkmark.circle")
                }

            }else{
                Button {
                    editStatus.toggle()
                } label: {
                    Image(systemName: "pencil")
                }
            }
            

        })
        .navigationTitle(noteItem.title ?? "")
    }
}

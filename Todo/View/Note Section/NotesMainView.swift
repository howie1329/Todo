//
//  NotesMainView.swift
//  Todo
//
//  Created by Howard Thomas on 5/3/23.
//

import SwiftUI

struct NotesMainView: View {
    @EnvironmentObject var dm:DataModel
    
    @State var newNoteView = false
    var body: some View {
        NavigationView{
            List{
                ForEach(dm.savedNotesEntities) { note in
                    NavigationLink {
                        NoteDetailView(noteItem: note, bodyNote: note.body ?? "")
                    } label: {
                        HStack{
                            Text(note.title ?? "")
                            Spacer()
                            Text("\(note.dateCreated?.formatted(date: .numeric, time: .shortened) ?? "")")
                        }
                    }
                }
                .onDelete(perform: dm.deleteNote)
            }
            .toolbar(content: {
                Button {
                    newNoteView.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                }

            })
            .sheet(isPresented: $newNoteView, content: {
                AddNewNoteView(newNoteViewStatus: $newNoteView)
            })
            .navigationTitle("Important Stuff!!!")
        }
    }
}

struct NotesMainView_Previews: PreviewProvider {
    static var previews: some View {
        NotesMainView()
    }
}

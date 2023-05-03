//
//  NoteModel.swift
//  Todo
//
//  Created by Howard Thomas on 5/3/23.
//

import Foundation

struct Note: Identifiable {
    
    var id: UUID
    var title:String
    var body:String
    var date:Date
}

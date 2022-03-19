//
//  Data.swift
//  ZametkiNew
//
//  Created by Ilya Kokorin on 17.03.2022.
//

import Foundation

class Note {
    var noteDate: Date
    var noteBody: String
    init(noteDate: Date,noteBody: String){
        self.noteDate = noteDate
        self.noteBody = noteBody
    }
}

    var notes = [
        Note(noteDate: Date(timeIntervalSinceReferenceDate: 10298397), noteBody: "Привет, это первая заметка, если хочешь - удали")
    ]



//
//  Note.swift
//  Quiz_Class6
//
//  Created by Kevin Lopez on 4/26/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import Foundation

struct Note {
    let name: String
    let date: Date
    let isNew: Bool
}

extension Note {
    var isNewText: String {
        if isNew {
            return "Note named \(name) is brand new"
        } else {
            return "Note named \(name) was created more than 5 mins ago"
        }
    }
}

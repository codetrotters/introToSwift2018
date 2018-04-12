//
//  ChecklistItem.swift
//  TableView_KL_Class
//
//  Created by Kevin Lopez on 4/10/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import Foundation

struct ChecklistItem {
    var title: String = ""
    var itemDescription: String = ""
    var isSelected: Bool = false
}

extension ChecklistItem {
    var isValid: Bool {
        return !title.isEmpty && !itemDescription.isEmpty
    }
}

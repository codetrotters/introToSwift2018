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
    
    static var defaultData: [ChecklistItem] {
        var array = [ChecklistItem]()
        for _ in 0...100 {
            array.append(ChecklistItem(title: "Deleteing", itemDescription: "fihrifhdifhergef", isSelected: false))
        }
        return array
    }
}

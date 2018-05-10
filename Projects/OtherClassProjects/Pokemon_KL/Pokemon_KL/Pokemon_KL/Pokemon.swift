//
//  Pokemon.swift
//  Pokemon_KL
//
//  Created by Kevin Lopez on 5/3/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    var name: String = ""
    var url: String = ""
    var imageURLString: String? = ""
}

extension Pokemon {
    
    var id: Int {
        var urlComponents = url.components(separatedBy: "/")
        urlComponents.removeLast()
        let intString = urlComponents.last ?? ""
        return Int(intString) ?? 0
    }
    
}

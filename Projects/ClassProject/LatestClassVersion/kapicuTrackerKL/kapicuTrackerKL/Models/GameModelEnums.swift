//
//  GameModelEnums.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 5/17/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import Foundation

enum NumberOfPlayers: Int {
    case two = 2
    case three = 3
    case four = 4
    
    var txt: String {
        switch self {
        case .two:
            return "Two"
        case .three:
            return "Three"
        case .four:
            return "Four"
        }
    }
}

enum PlayerToConfigure: Int {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case allConfigured = 5
    
    var teamMember: String {
        return self.rawValue < 3 ? "A" : "B"
    }
}

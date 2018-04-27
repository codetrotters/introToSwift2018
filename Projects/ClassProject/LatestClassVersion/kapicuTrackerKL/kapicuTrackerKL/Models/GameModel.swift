//
//  GameModel.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 4/26/18.
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

struct GameModel {
    var numberOfPlayers: NumberOfPlayers = .two
    var firstPlayer: String = ""
    var secondPlayer: String = ""
    var thirdPlayer: String = ""
    var fourthPlayer: String = ""
    
    let nameOf = "Name of "
}

extension GameModel {
    
    private var isTeamPlay: Bool {
        return numberOfPlayers == .four
    }
    
    func navTitleFor(_ player: PlayerToConfigure) -> String {
        let playerNumber = "\(player.rawValue)"
        let teamMember = player.teamMember
        
        let teamFormat = ", Team %@"
        let playerFormat = "Player %@"
        
        let teamString = String(format: teamFormat, arguments: [teamMember])
        let playerString = String(format: playerFormat, arguments: [playerNumber])
        
        return isTeamPlay ? playerString + teamString : playerString
    }
    
    func placeholderTextFor(_ player: PlayerToConfigure) -> String {
        return nameOf + navTitleFor(player)
    }
}






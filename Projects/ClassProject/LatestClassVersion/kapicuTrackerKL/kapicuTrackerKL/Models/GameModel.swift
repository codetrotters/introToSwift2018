//
//  GameModel.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 4/26/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import Foundation

struct GameModel {
    var numberOfPlayers: NumberOfPlayers = .two
    var firstPlayer: String = ""
    var secondPlayer: String = ""
    var thirdPlayer: String = ""
    var fourthPlayer: String = ""
    var winningScore: Int = 500
}

extension GameModel {
    
    private var nameOf: String {
        return "Name of "
    }
    
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
    
    func nextPlayerToConfigure(_ currentPlayer: PlayerToConfigure) -> PlayerToConfigure {
        switch currentPlayer {
        case .one:
            return .two
        case .two:
            let hasMoreThanTwoPlayers = numberOfPlayers.rawValue > 2
            return hasMoreThanTwoPlayers ? .three : .allConfigured
        case .three:
            let hasMoreThanThreePlayers = numberOfPlayers.rawValue > 3
            return hasMoreThanThreePlayers ? .four : .allConfigured
        case .four, .allConfigured:
            return .allConfigured
        }
    }
    
    mutating func updatePlayerName(_ name: String, _ player: PlayerToConfigure) {
        switch player {
        case .one:
            firstPlayer = name
        case .two:
            secondPlayer = name
        case .three:
            thirdPlayer = name
        case .four:
            fourthPlayer = name
        case .allConfigured:
            break
        }
    }
    
    mutating func updateWinningScore(_ score: Int) {
        self.winningScore = score
    }
}






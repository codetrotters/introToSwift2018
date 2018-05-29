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
    var withPrizes: Bool = true
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
}

extension GameModel {
    
    static func defaultModel(with numberOfPlayers: NumberOfPlayers) -> GameModel {
        
        let hasAtLeast3 = numberOfPlayers == .three || numberOfPlayers == .four
        let has4 = numberOfPlayers == .four
        
        let playerOne = "Roberto"
        let playerTwo = "Nancy"
        let playerThree = hasAtLeast3 ? "Miguel" : ""
        let playerFour = has4 ? "Maria" : ""
        
        let winningScore = ScoreSelectionViewController.WinningScore.fiveHundred.rawValue
        
        return GameModel(
            numberOfPlayers: numberOfPlayers,
            firstPlayer: playerOne,
            secondPlayer: playerTwo,
            thirdPlayer: playerThree,
            fourthPlayer: playerFour,
            winningScore: winningScore,
            withPrizes: true
        )
    }
}










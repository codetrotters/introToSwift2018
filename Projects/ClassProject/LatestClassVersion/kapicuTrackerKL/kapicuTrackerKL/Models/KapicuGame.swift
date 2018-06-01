//
//  KapicuGame.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 4/26/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import Foundation

class KapicuGame {
    
    private var gameModel: GameModel
    
    init(_ gameModel: GameModel = GameModel()) {
        self.gameModel = gameModel
    }
    
    convenience init(_ numberOfPlayers: Int) {
        self.init()
        let numberOfPlayers = NumberOfPlayers(rawValue: numberOfPlayers)!
        updatePlayerCount(numberOfPlayers)
    }
}

// MARK: - Custom getters

extension KapicuGame {
    
    var numberOfPlayers: NumberOfPlayers {
        return gameModel.numberOfPlayers
    }
    
    func navTitleFor(_ player: PlayerToConfigure) -> String {
        return gameModel.navTitleFor(player)
    }
    
    func placeholderFor(_ player: PlayerToConfigure) -> String {
        return gameModel.placeholderTextFor(player)
    }
    
    func nextPlayerToConfigure(_ currentPlayer: PlayerToConfigure) -> PlayerToConfigure {
        return gameModel.nextPlayerToConfigure(currentPlayer)
    }
    
    func name(of player: PlayerToConfigure) -> String {
        switch player {
        case .one:
            return gameModel.firstPlayer
        case .two:
            return gameModel.secondPlayer
        case .three:
            return gameModel.thirdPlayer
        case .four:
            return gameModel.fourthPlayer
        default:
            return ""
        }
    }
}

// MARK: - Mutating functions

extension KapicuGame {
    func updatePlayerCount(_ numberOfPlayers: NumberOfPlayers) {
        gameModel.numberOfPlayers = numberOfPlayers
    }
    
    func updatePlayerName(_ name: String, _ player: PlayerToConfigure) {
        switch player {
        case .one:
            gameModel.firstPlayer = name
        case .two:
            gameModel.secondPlayer = name
        case .three:
            gameModel.thirdPlayer = name
        case .four:
            gameModel.fourthPlayer = name
        case .allConfigured:
            break
        }
    }
    
    func updateWinningScore(_ score: Int) {
        gameModel.winningScore = score
    }
    
    func updatePrizeOption(_ withPrizes: Bool) {
        gameModel.withPrizes = withPrizes
    }
}


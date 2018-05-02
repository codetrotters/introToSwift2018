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
    func navTitleFor(_ player: PlayerToConfigure) -> String {
        return gameModel.navTitleFor(player)
    }
    
    func placeholderFor(_ player: PlayerToConfigure) -> String {
        return gameModel.placeholderTextFor(player)
    }
    
    func nextPlayerToConfigure(_ currentPlayer: PlayerToConfigure) -> PlayerToConfigure {
        return gameModel.nextPlayerToConfigure(currentPlayer)
    }
}

// MARK: - Mutating functions

extension KapicuGame {
    func updatePlayerCount(_ numberOfPlayers: NumberOfPlayers) {
        gameModel.numberOfPlayers = numberOfPlayers
    }
    
    func updatePlayerName(_ name: String, _ player: PlayerToConfigure) {
        gameModel.updatePlayerName(name, player)
    }
}








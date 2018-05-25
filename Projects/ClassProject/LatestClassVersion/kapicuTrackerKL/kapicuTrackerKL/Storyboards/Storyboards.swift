//
//  Storyboards.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 5/17/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import Foundation
import UIKit

struct MainStoryboard {
    
    static var main: UIStoryboard {
        return Storyboards.main.board
    }
    
    static var numberOfPlayersVC: NumberOfPlayersViewController {
        return main.vcOfType(.numberOfPlayers) as! NumberOfPlayersViewController
    }
    
    static var playerNameEntryVC: PlayerNameEntryViewController {
        return main.vcOfType(.playerName) as! PlayerNameEntryViewController
    }
    
    static var scoreSelectionVC: ScoreSelectionViewController {
        return main.vcOfType(.scoreSelection) as! ScoreSelectionViewController
    }
    
    static var prizeSelection: PrizeSelectionViewController {
        return main.vcOfType(.prizeSelection) as! PrizeSelectionViewController
    }
    
    static var gameVC: GameViewController {
        return main.vcOfType(.gameView) as! GameViewController
    }
}

























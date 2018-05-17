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
        return main.instantiateViewController(withIdentifier: VCIdentifiers.numberOfPlayers.txt) as! NumberOfPlayersViewController
    }
    
}
















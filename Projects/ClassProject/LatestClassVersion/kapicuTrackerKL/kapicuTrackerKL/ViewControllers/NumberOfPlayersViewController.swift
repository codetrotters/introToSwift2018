//
//  NumberOfPlayersViewController.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 4/3/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

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

class NumberOfPlayersViewController: UIViewController {
    

    @IBOutlet var playerButtons: [UIButton]! {
        didSet {
      
            for button in playerButtons {
                guard let numberOfPlayers = NumberOfPlayers(rawValue: button.tag) else {
                    continue
                }
                button.apply(ButtonStyle.standard, with: numberOfPlayers.txt)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Number Of Players"
    }
}

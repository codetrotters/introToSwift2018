//
//  NumberOfPlayersViewController.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 4/3/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

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
        configureBackBarButton()
        title = "Number Of Players"
    }
    
    @IBAction func playerButtonPressed(_ sender: UIButton) {
        let kapicuGame = KapicuGame(sender.tag)
        let playerNameVC = storyboard?.instantiateViewController(withIdentifier: "playerName") as! PlayerNameEntryViewController
        playerNameVC.kapicuGame = kapicuGame
        navigationController?.pushViewController(playerNameVC, animated: true)
    }
}

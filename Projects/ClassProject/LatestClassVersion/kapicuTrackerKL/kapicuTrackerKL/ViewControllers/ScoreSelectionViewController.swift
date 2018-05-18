//
//  ScoreSelectionViewController.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 5/17/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class ScoreSelectionViewController: UIViewController {
    
    enum WinningScore: Int {
        case threeHundred = 300
        case fiveHundred = 500
        
        var txt: String {
            return "\(self.rawValue)"
        }
    }
    
    @IBOutlet weak var firstScoreButton: UIButton! {
        didSet {
            let type = WinningScore.threeHundred
            firstScoreButton.apply(ButtonStyle.standard, with: type.txt)
            firstScoreButton.tag = type.rawValue
        }
    }
    
    @IBOutlet weak var secondScoreButton: UIButton! {
        didSet {
            let type = WinningScore.fiveHundred
            secondScoreButton.apply(ButtonStyle.standard, with: type.txt)
            secondScoreButton.tag = type.rawValue
        }
    }
    
    var kapicuGame: KapicuGame!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Winning Score"
    }
    
    @IBAction func scoreButtonPressed(_ sender: UIButton) {
        guard let scoreType = WinningScore(rawValue: sender.tag) else {
            return
        }
        
        kapicuGame.updateWinningScore(scoreType.rawValue)
        // take user to prize view
    }
}

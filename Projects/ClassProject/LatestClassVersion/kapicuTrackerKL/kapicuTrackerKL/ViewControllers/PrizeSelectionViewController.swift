//
//  PrizeSelectionViewController.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 5/24/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class PrizeSelectionViewController: UIViewController {
    
    enum PrizeType: Int {
        case with = 1
        case without = 2
        
        var isWithPrize: Bool {
            return self == .with
        }
    }
    
    var kapicuGame: KapicuGame!
    
    @IBOutlet weak var withPrizesButton: UIButton! {
        didSet {
            withPrizesButton.apply(ButtonStyle.standard, with: "With")
            withPrizesButton.tag = PrizeType.with.rawValue
        }
    }
    
    @IBOutlet weak var withoutPrizeButton: UIButton! {
        didSet {
            withoutPrizeButton.apply(ButtonStyle.standard, with: "Without")
            withoutPrizeButton.tag = PrizeType.without.rawValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Prizes"
    }
    
    @IBAction func prizeButtonPressed(_ sender: UIButton) {
        guard let prizeType = PrizeType(rawValue: sender.tag) else {
            return
        }
        kapicuGame.updatePrizeOption(prizeType.isWithPrize)
        
        let gameVC = MainStoryboard.gameVC
        gameVC.kapicuGame = kapicuGame
        
        let navController = UINavigationController(rootViewController: gameVC)
        
        navigationController?.present(navController, animated: true, completion: nil)
    }
}






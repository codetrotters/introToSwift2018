//
//  HomeViewController.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 3/27/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var newGameButton: UIButton! {
        didSet {
            newGameButton.apply(ButtonStyle.standard, with: "New Game")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureBackBarButton()
    }
    
    @IBAction func newGameButtonPressed(_ sender: UIButton) {
        //let numberOfPlayersViewController = MainStoryboard.numberOfPlayersVC
        
        let gameVC = MainStoryboard.gameVC
        gameVC.kapicuGame = KapicuGame(GameModel.defaultModel(with: .three))
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    private func configureNavigationBar() {
        title = "KapicuTracker"
    }
}

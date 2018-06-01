//
//  GameViewController.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 5/24/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    let scoreViewTag = 2018
    
    @IBOutlet weak var scoreTableViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView(frame: .zero)
        }
    }
    
    var kapicuGame: KapicuGame!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Game"
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.estimatedSectionHeaderHeight = 100
        print("Kapicu game \(kapicuGame.numberOfPlayers.txt)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.layoutIfNeeded()
        let headerView = tableView.viewWithTag(scoreViewTag)
        scoreTableViewHeightConstraint.constant = headerView?.frame.height ?? 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gameDetailsVC = segue.destination as? GameDetailsViewController {
            gameDetailsVC.kapicuGame = kapicuGame
        }
    }
}

extension GameViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "scoreCell") as? ScoreCell
        headerCell?.configure(with: kapicuGame)
        headerCell?.backgroundColor = .white
        headerCell?.tag = scoreViewTag
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        return cell
    }
}









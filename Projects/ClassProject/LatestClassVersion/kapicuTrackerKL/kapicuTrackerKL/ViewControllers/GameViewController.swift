//
//  GameViewController.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 5/24/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
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
}

extension GameViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "scoreCell") as? ScoreCell
        headerCell?.leftScoreStackView.isHidden = true
        headerCell?.rightScoreStackView.alignment = .center
        headerCell?.backgroundColor = .yellow
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
}









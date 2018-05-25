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
    }
}

extension GameViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}









//
//  ScoreCell.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 5/29/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class ScoreCell: UITableViewCell {
    
    // Top and bottom half
    
    @IBOutlet weak var topHalfScoreStackView: UIStackView!
    
    @IBOutlet weak var bottomHalfScoreStackView: UIStackView!
 
    // Top half
    
    @IBOutlet weak var topLeftScoreStackView: UIStackView!
    
    @IBOutlet weak var topLeftScoreLabel: UILabel! {
        didSet {
            topLeftScoreLabel.text = "0"
            topLeftScoreLabel.font = UIFont.boldSystemFont(ofSize: 50)
        }
    }
    
    @IBOutlet weak var topLeftNameLabel: UILabel!
    
    @IBOutlet weak var topRightScoreStackView: UIStackView!
    
    @IBOutlet weak var topRightScoreLabel: UILabel! {
        didSet {
            topRightScoreLabel.text = "0"
            topRightScoreLabel.font = UIFont.boldSystemFont(ofSize: 50)
        }
    }
    
    @IBOutlet weak var topRightNameLabel: UILabel!
    
    // Bottom half
    
    @IBOutlet weak var bottomLeftScoreStackView: UIStackView!
    
    @IBOutlet weak var bottomLeftScoreLabel: UILabel! {
        didSet {
            bottomLeftScoreLabel.text = "0"
            bottomLeftScoreLabel.font = UIFont.boldSystemFont(ofSize: 50)
        }
    }
    
    @IBOutlet weak var bottomLeftNameLabel: UILabel!
    
    @IBOutlet weak var bottomRightScoreStackView: UIStackView!
    
    @IBOutlet weak var bottomRightScoreLabel: UILabel! {
        didSet {
            bottomRightScoreLabel.text = "0"
            bottomRightScoreLabel.font = UIFont.boldSystemFont(ofSize: 50)
        }
    }
    
    @IBOutlet weak var bottomRightNameLabel: UILabel!
    
    func configure(with kapicuGame: KapicuGame) {
        
        switch kapicuGame.numberOfPlayers {
    
        case .two:
            bottomHalfScoreStackView.isHidden = true
            topLeftNameLabel.text = kapicuGame.name(of: .one)
            topRightNameLabel.text = kapicuGame.name(of: .two)
            
        case .three:
            bottomLeftScoreStackView.isHidden = true
            bottomRightScoreStackView.alignment = .center
            
            topLeftNameLabel.text = kapicuGame.name(of: .one)
            topRightNameLabel.text = kapicuGame.name(of: .two)
            bottomRightNameLabel.text = kapicuGame.name(of: .three)
            
        case .four:
            topLeftScoreStackView.isHidden = true
            topRightScoreStackView.alignment = .center
            
            bottomLeftScoreStackView.isHidden = true
            bottomRightScoreStackView.alignment = .center
            
            topRightNameLabel.text = kapicuGame.name(of: .one) + " / " + kapicuGame.name(of: .two)
            bottomRightNameLabel.text = kapicuGame.name(of: .three) + " / " + kapicuGame.name(of: .four)
        }
    }
}










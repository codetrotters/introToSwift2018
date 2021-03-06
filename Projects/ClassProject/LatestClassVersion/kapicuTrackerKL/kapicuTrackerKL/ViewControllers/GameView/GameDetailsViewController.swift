//
//  GameDetailsViewController.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 5/31/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class GameDetailsViewController: UIViewController {
    
    let numberOfCells = 100
    let minimumSpacing: CGFloat = 2
    let extraColumnForRound = 1
    
    var kapicuGame: KapicuGame!
    
    @IBOutlet weak var scoreByRoundCollectionView: UICollectionView!
    {
        didSet{
            scoreByRoundCollectionView.backgroundColor = .lightGray
            scoreByRoundCollectionView.bounces = false
            scoreByRoundCollectionView.showsVerticalScrollIndicator = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension GameDetailsViewController: UICollectionViewDelegate {
    
}

extension GameDetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "defaultCell", for: indexPath) as! GameDetailCollectionViewCell
        
        if isInRoundColumn(indexPath) {
            let round = (indexPath.row / columnsBasedOnNumberOfPlayers) + 1
            cell.textLabel.text = "\(round)"
        } else {
            cell.textLabel.text = "Score Cell"
        }
        
        cell.backgroundColor = .white
        return cell
    }
    
}

extension GameDetailsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let viewWidth = UIScreen.main.bounds.width
        let columns = CGFloat(columnsBasedOnNumberOfPlayers)
        let cellSpacing = minimumSpacing
        
        var cellWidth = (viewWidth - (columns - 1) * cellSpacing) / columns
        let cellHeight = cellWidth / 2.0
        
        if isInRoundColumn(indexPath) {
            cellWidth = cellHeight
        } else {
            cellWidth += cellWidth / CGFloat(columnsBasedOnNumberOfPlayers + 2)
        }
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    private var columnsBasedOnNumberOfPlayers: Int {
        var numberOfPlayers = kapicuGame.numberOfPlayers
        numberOfPlayers = (numberOfPlayers == .four) ? .two : numberOfPlayers
        return numberOfPlayers.rawValue + extraColumnForRound
    }
    
    private func isInRoundColumn(_ indexPath: IndexPath) -> Bool {
        return indexPath.row % columnsBasedOnNumberOfPlayers == 0
    }
}

















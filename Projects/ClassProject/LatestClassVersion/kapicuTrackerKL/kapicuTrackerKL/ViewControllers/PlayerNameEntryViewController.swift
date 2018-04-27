//
//  PlayerNameEntryViewController.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 4/26/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class PlayerNameEntryViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    var kapicuGame: KapicuGame!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = kapicuGame.navTitleFor(.one)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextButtonPressed))
        navigationItem.rightBarButtonItem?.tintColor = .black
        nameTextField.placeholder = kapicuGame.placeholderFor(.one)
    }

    @objc private func nextButtonPressed() {
        
    }

}

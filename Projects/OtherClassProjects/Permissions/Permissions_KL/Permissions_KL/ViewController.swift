//
//  ViewController.swift
//  Permissions_KL
//
//  Created by Kevin Lopez on 5/22/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func imageButtonPressed(_ sender: Any) {
        imageView.backgroundColor = .yellow
    }
    

}


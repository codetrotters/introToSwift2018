//
//  ModalViewController.swift
//  AnotherTableView_KL_Class
//
//  Created by Kevin Lopez on 4/24/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    var viewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func dismissButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

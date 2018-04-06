//
//  UIViewControllerExtensions.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 4/5/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func configureBackBarButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .black
    }
    
}

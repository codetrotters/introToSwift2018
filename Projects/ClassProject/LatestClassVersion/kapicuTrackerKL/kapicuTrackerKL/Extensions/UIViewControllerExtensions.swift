//
//  UIViewControllerExtensions.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 4/5/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func configureBackBarButton(_ title: String? = nil) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .black
    }
    
}

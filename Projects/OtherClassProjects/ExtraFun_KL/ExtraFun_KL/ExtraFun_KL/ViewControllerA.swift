//
//  ViewControllerA.swift
//  ExtraFun_KL
//
//  Created by Kevin Lopez on 5/15/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class ViewControllerA: UIViewController {
    
    @IBOutlet weak var animatingView: UIView!
    
    @IBOutlet weak var animatingViewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var beginAnimationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.tabBarItem.tag = 5
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapTriggered))
        tapGesture.numberOfTapsRequired = 2
        
        let otherGesture = UIPanGestureRecognizer(target: self, action: #selector(panTriggered))
        
        animatingView.addGestureRecognizer(tapGesture)
        animatingView.addGestureRecognizer(otherGesture)
    }
    
    @objc private func tapTriggered() {
        animatingView.backgroundColor = .magenta
    }
    
    @objc private func panTriggered() {
        animatingView.backgroundColor = .yellow
    }
    
    @IBAction func beginAnimationButtonPressed(_ sender: Any) {
        
//        self.animatingViewWidthConstraint.constant = 200
//        UIView.animate(withDuration: 1.0, animations: {
//            self.animatingView.layoutIfNeeded()
//        }) { (_) in
//
//            self.animatingViewWidthConstraint.constant = 100
//            UIView.animate(withDuration: 1.0, animations: {
//                self.animatingView.layoutIfNeeded()
//            })
//        }
    }
    
}

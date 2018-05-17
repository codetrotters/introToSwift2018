//
//  MainTabBarController.swift
//  ExtraFun_KL
//
//  Created by Kevin Lopez on 5/15/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        print("Tab bar item: \(item.tag)")
    }
    
}

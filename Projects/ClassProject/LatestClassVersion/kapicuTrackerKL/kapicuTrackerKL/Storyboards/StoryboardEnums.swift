//
//  StoryboardEnums.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 5/17/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import Foundation
import UIKit

enum Storyboards: String {
    case main
    case settings
    
    var board: UIStoryboard {
        return UIStoryboard(name: self.rawValue.firstLetterCapitalized, bundle: nil)
    }
}

enum VCIdentifiers: String {
    case numberOfPlayers
    case playerName
    case scoreSelection
    
    var txt: String {
        return self.rawValue
    }
}

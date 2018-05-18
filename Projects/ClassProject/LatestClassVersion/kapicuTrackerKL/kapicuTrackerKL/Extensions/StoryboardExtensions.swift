//
//  StoryboardExtensions.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 5/17/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

extension UIStoryboard {
    func vcOfType(_ type: VCIdentifiers) -> UIViewController {
        return self.instantiateViewController(withIdentifier: type.txt)
    }
}

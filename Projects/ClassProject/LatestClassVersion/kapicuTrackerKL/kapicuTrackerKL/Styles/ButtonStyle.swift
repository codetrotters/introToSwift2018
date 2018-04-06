//
//  ButtonStyle.swift
//  kapicuTrackerKL
//
//  Created by Kevin Lopez on 4/5/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

protocol ButtonStyleAttribute {
    var cornerRadius: CGFloat { get }
    var backgroundColor: UIColor { get }
    var titleColor: UIColor { get }
}

struct StandardButton: ButtonStyleAttribute {
    var cornerRadius: CGFloat = 5.0
    var backgroundColor: UIColor = .deepBlue
    var titleColor: UIColor = .white
}

struct ButtonStyle {
    static let standard = StandardButton()
}

extension UIButton {
    
    func apply(_ attribute: ButtonStyleAttribute, with title: String) {
        self.layer.cornerRadius = attribute.cornerRadius
        self.backgroundColor = attribute.backgroundColor
        self.setTitleColor(attribute.titleColor, for: .normal)
        self.setTitle(title, for: .normal)
    }
    
}

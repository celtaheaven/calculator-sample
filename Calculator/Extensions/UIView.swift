//
//  UIView.swift
//  Calculator
//
//  Created by g.guimaraes on 05/08/20.
//  Copyright © 2020 Guilherme Guimaraes. All rights reserved.
//

import UIKit

extension UIView {
    func addSubview(_ view: UIView, _ constraints: [NSLayoutConstraint]) {
        view.translatesAutoresizingMaskIntoConstraints = false

        constraints.forEach({ $0.isActive = true })
    }
}

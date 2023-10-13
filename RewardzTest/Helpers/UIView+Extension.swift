//
//  UIView+Extension.swift
//  RewardzTest
//
//  Created by Softsuave on 12/10/2023.
//

import Foundation
import UIKit

extension UIView {
    func setConstraints(mainView: UIView, respectiveView: UIView, height: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.leadingAnchor.constraint(equalToSystemSpacingAfter: mainView.leadingAnchor, multiplier: 1).isActive = true
        self.trailingAnchor.constraint(equalToSystemSpacingAfter: mainView.trailingAnchor, multiplier: 1).isActive = true
        self.widthAnchor.constraint(equalToConstant: mainView.frame.width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.topAnchor.constraint(equalToSystemSpacingBelow: respectiveView.lastBaselineAnchor, multiplier: 1).isActive = true
    }
}

//
//  NSLayoutDimension+Extension.swift
//  macrochallenge
//
//  Created by Bryanza on 27/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import UIKit

extension NSLayoutDimension {

@discardableResult
func set(
        to constant: CGFloat,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {

        let cons = constraint(equalToConstant: constant)
        cons.priority = priority
        cons.isActive = true
        return cons
    }
}

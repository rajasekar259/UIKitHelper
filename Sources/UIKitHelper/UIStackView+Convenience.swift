//
//  UIStackView+Convenience.swift
//
//  Created by rajasekar.r on 24/08/23.
//

import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis,
                     distribution: Distribution,
                     alignment: UIStackView.Alignment,
                     spacing: CGFloat = 0,
                     layoutMargins: UIEdgeInsets? = nil) {
        self.init()
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        if let layoutMargins {
            self.isLayoutMarginsRelativeArrangement = true
            self.layoutMargins = layoutMargins
        }
    }

    func addArrangedSubviews(_ subviews: [UIView?]) {
        subviews.compactMap { $0 }
            .forEach {
                addArrangedSubview($0)
            }
    }
}

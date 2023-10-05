//
//  UIView+AutoLayout.swift
//
//  Created by rajasekar.r on 20/08/23.
//

import UIKit

extension UIView {
    func fillSuperView(insets: UIEdgeInsets = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: insets.left),
            self.topAnchor.constraint(equalTo: superview!.topAnchor, constant: insets.top),
            self.trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -insets.right),
            self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: -insets.bottom),
        ])
    }

    func setSize(width: CGFloat?, height: CGFloat?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }

    static var newFlexiView: UIView {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return view
    }
}

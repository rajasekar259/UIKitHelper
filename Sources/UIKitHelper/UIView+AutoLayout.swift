//
//  UIView+AutoLayout.swift
//
//  Created by rajasekar.r on 20/08/23.
//

import UIKit

public extension UIView {
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
    
    func horizontalCenterTo(view: UIView? = nil, xOffset: CGFloat) {
        guard let refView = view ?? superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: refView.centerXAnchor, constant: xOffset).isActive = true
    }
    
    func verticalCenterTo(view: UIView? = nil, yOffset: CGFloat) {
        guard let refView = view ?? superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: refView.centerYAnchor, constant: yOffset).isActive = true
    }
    
    func centerToSuperView(offset: CGPoint = .zero) {
        horizontalCenterTo(xOffset: offset.x)
        verticalCenterTo(yOffset: offset.y)
    }
}


public extension UIView {
    static var newFlexiView: UIView {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return view
    }
}


public protocol NibLoadable {}

public extension NibLoadable where Self: UIView {
    static func loadFromNib(name: String? = nil) -> Self! {
        let bundle = Bundle(for: Self.classForCoder())
        let nib = UINib(nibName: name ?? String(describing: Self.self), bundle: bundle)
        let nibView = nib.instantiate(withOwner: nil, options: nil).first as? Self

        return nibView
    }
}

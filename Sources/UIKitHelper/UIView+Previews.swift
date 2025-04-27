//
//  File.swift
//  UIKitHelper
//
//  Created by rajasekar.r on 27/04/25.
//

import Foundation
import UIKit
import SwiftUI


public struct UIViewContainer<Content: UIView>: UIViewRepresentable {
    let uiView: Content

    public init(uiView: Content) {
        self.uiView = uiView
    }

    public func makeUIView(context: Context) -> Content {
        uiView
    }

    public func updateUIView(_ uiView: Content, context: Context) {}
}

public struct UIVCContainer<Content: UIViewController>: UIViewControllerRepresentable {
    let uiVC: Content

    public init(uiVC: Content) {
        self.uiVC = uiVC
    }

    public func makeUIViewController(context: Context) -> Content {
        uiVC
    }

    public func updateUIViewController(_ uiViewController: Content, context: Context) {}
}

//
//  OverlayPresentationController.swift
//  macrochallenge
//
//  Created by Bryanza on 17/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import UIKit

class OverlayPresentationController: UIPresentationController {
    
    private let dimmedBackgroundView = UIView()
    private var height: CGFloat = 200
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped))
        self.dimmedBackgroundView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func setHeight(height: CGFloat) {
        self.height = height
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        var frame =  CGRect.zero
        if let containerBounds = containerView?.bounds {
            frame = CGRect(x: 0,
                           y: containerBounds.height - self.height,
                           width: containerBounds.width,
                           height: self.height)
        }
        return frame
    }
    
    override func presentationTransitionWillBegin() {
        if let containerView = self.containerView, let coordinator = presentingViewController.transitionCoordinator {
            containerView.addSubview(self.dimmedBackgroundView)
            self.dimmedBackgroundView.backgroundColor = .black
            self.dimmedBackgroundView.frame = containerView.bounds
            self.dimmedBackgroundView.alpha = 0
            coordinator.animate(alongsideTransition: { _ in
                self.dimmedBackgroundView.alpha = 0.5
            }, completion: nil)
        }
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if !completed {
            self.dimmedBackgroundView.removeFromSuperview()
        }
    }
    
    @objc private func backgroundTapped() {
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
    
    
}

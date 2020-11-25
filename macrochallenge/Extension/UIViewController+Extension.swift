//
//  UIViewController+Extension.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 07/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.endEditingKeyboard))
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
    }
    
    @objc func endEditingKeyboard() {
        view.endEditing(true)
    }
    
    func checkLoginUser() {
        if PreferenceManager.instance.isLogin {
            return
        }
        
        let signInViewController = SignInViewController.instantiateSheetViewController(isCanDismiss: true, lastViewController: self)
        self.present(signInViewController, animated: false, completion: nil)
    }
}

extension UIViewController {

    var heightScreen: CGFloat {
        return UIScreen.main.bounds.height
    }

    var widthScreen: CGFloat {
        return UIScreen.main.bounds.width
    }
}

extension UIViewController {
    func hideKeyboardWhenTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//extension UIViewController: UITableViewDataSource, UIScrollViewDelegate, UITableViewDelegate, UISearchBarDelegate {
//    
//}

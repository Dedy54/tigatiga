//
//  AddPostVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 10/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var postButton: UIButton!
    
    var addPostPlayer = AddPostLFMemberVC()
    var addPostTeam = AddPostLFGroupVC()
    
    var views : [UIView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTapped()
        segmentedControl.frame.size.height = 40
        
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        
        
        overrideUserInterfaceStyle = .dark
        setSegmentedViewInContainer()
        
        postButton.layer.cornerRadius = 15
        
    }
    
    func setSegmentedViewInContainer(){
//        views = [UIView]()
//        views.append(addPostPlayer.view)
//        views.append(addPostTeam.view)
//
//        for v in views {
//            viewContainer.addSubview(v)
//        }
//
//        viewContainer.bringSubviewToFront(views[0])
        
        viewContainer.addSubview(addPostTeam.view)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
        self.viewContainer.bringSubviewToFront(views[sender.selectedSegmentIndex])
    }
    
    
    @IBAction func postTapped(_ sender: Any) {
        
    }
    
}

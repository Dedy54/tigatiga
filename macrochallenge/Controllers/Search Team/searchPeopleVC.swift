//
//  searchPeopleVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 26/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class searchPeopleVC: UIViewController, UITextFieldDelegate{

    @IBOutlet var viewContainer: UIView!
    @IBOutlet var applyButton: UIButton!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    var searchPlayerVC = searchForPlayerVC()
    var searchTeamVC = searchForTeamVC()
    
   
    var views : [UIView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        segmentedControl.frame.size.height = 40
        setApplyBtnShape()
        
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        setSegmentedViewInContainer()
        
        overrideUserInterfaceStyle = .dark
        
    }
    
    func setApplyBtnShape(){
        applyButton.layer.cornerRadius = 10
    }
    
    func setSegmentedViewInContainer(){
        views = [UIView]()
        views.append(searchPlayerVC.view)
        views.append(searchTeamVC.view)
        
        for v in views {
            viewContainer.addSubview(v)
            
        }
        self.addChild(searchForPlayerVC())
        self.addChild(searchForTeamVC())
        viewContainer.bringSubviewToFront(views[0])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
           return false
       }
    
    
    
    
    

    
    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
        views[sender.selectedSegmentIndex].isUserInteractionEnabled = false
        self.viewContainer.bringSubviewToFront(views[sender.selectedSegmentIndex])
    }
    
  
}




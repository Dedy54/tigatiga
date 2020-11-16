//
//  CompleteProfileViewController.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 13/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class CompleteProfileViewController: UIViewController {
    
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var skillLabel: UILabel!
    
    @IBAction func actionGame(_ sender: Any) {
        let done: ActionStringDoneBlock = {(picker, selectedIndex, selectedValue) in
            print("done")
        }

        let picker = ActionSheetStringPicker(title: "Choose Game", rows: [""], initialSelection: 0, doneBlock: done, cancel: nil, origin: sender)

        let doneButton = UIBarButtonItem(title: "DONE", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "CANCEL", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        picker?.setDoneButton(doneButton)
        picker?.setCancelButton(cancelButton)

        picker?.show()
    }
    
    @IBAction func actionRole(_ sender: Any) {
        let done: ActionStringDoneBlock = {(picker, selectedIndex, selectedValue) in
            print("done")
        }

        let picker = ActionSheetStringPicker(title: "Choose Role", rows: [""], initialSelection: 0, doneBlock: done, cancel: nil, origin: sender)

        let doneButton = UIBarButtonItem(title: "DONE", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "CANCEL", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        picker?.setDoneButton(doneButton)
        picker?.setCancelButton(cancelButton)

        picker?.show()
    }
    
    @IBAction func actionSkillRating(_ sender: Any) {
        let done: ActionStringDoneBlock = {(picker, selectedIndex, selectedValue) in
            print("done")
        }

        let picker = ActionSheetStringPicker(title: "Choose Skill Rating", rows: [""], initialSelection: 0, doneBlock: done, cancel: nil, origin: sender)

        let doneButton = UIBarButtonItem(title: "DONE", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "CANCEL", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        picker?.setDoneButton(doneButton)
        picker?.setCancelButton(cancelButton)

        picker?.show()
    }
    
    @IBAction func actionApply(_ sender: Any) {
        
    }
    
    static func instantiateViewController() -> CompleteProfileViewController {
        let controller = CompleteProfileViewController(nibName: "CompleteProfileViewController", bundle: nil)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

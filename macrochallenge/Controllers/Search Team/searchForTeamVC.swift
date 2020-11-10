//
//  searchForTeamVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 26/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class searchForTeamVC: UIViewController, UITextFieldDelegate{
     
    
    @IBOutlet weak var roleINTxtField: UITextField!
    
    @IBOutlet weak var skillRatingTxtField: UITextField!
    
    @IBOutlet weak var memberSizeTxtField: UITextField!
    @IBOutlet weak var roleTxtField: UITextField!
    
    @IBOutlet weak var searchTeamTextField: UITextField!
    
    
    let gameRoles = SwitchGame()
    let preferenceManager = PreferenceManager.instance
    var roleINpicker = UIPickerView()
    var skillRatingPicker = UIPickerView()
    var membersizePicker = UIPickerView()
    var rolePicker = UIPickerView()
    let mabarYellow = UIColor(hex: "#ffce00ff")?.cgColor
    
//    var userInteractor: UserInteractor? = UserInteractor()
    var selectedGame = GameTitle.Valorant
    var skillRatingDelegate: PickerDelegate?
    var roleInPickerDelegate: PickerDelegate?
    var rolePickerDelegate: PickerDelegate?
    var memberSizeDelegate: PickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roleINTxtField.inputView = roleINpicker
        skillRatingTxtField.inputView = skillRatingPicker
        memberSizeTxtField.inputView = membersizePicker
        roleTxtField.inputView = rolePicker
        
        searchTeamTextField.delegate = self
        setTextFieldShape()
        
        setTextFieldShape2(txtfld: roleINTxtField)
        setTextFieldShape2(txtfld: skillRatingTxtField)
        setTextFieldShape2(txtfld: memberSizeTxtField)
        setTextFieldShape2(txtfld: roleTxtField)
        
        teamPickerViewDelegate()
        
        roleINpicker.tag = 1
        skillRatingPicker.tag = 2
        membersizePicker.tag = 3
        rolePicker.tag = 4
        
        setPickerColor(picker: roleINpicker)
        setPickerColor(picker: skillRatingPicker)
        setPickerColor(picker: membersizePicker)
        setPickerColor(picker: rolePicker)
        
    }
    
    public func setTextFieldShape2(txtfld : UITextField){
        txtfld.layer.borderWidth = 0.5
        txtfld.layer.borderColor = mabarYellow
        txtfld.layer.cornerRadius = 5
        txtfld.frame.size.height = 44
        
        txtfld.tintColor = .clear
    }
    
    public func setTextFieldShape(){
        
        searchTeamTextField.layer.borderWidth = 1
        searchTeamTextField.layer.borderColor = mabarYellow
        searchTeamTextField.layer.cornerRadius = 5
        searchTeamTextField.frame.size.height = 44
        
        let imageView = UIImageView()
        let image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = UIColor(hex: "#ebebf599")
        imageView.image = image
        searchTeamTextField.leftView = imageView
        searchTeamTextField.leftViewMode = .always
    }

    func teamPickerViewDelegate(){
//        gameRoles.setTitle("Valorant")
        gameRoles.setTitle(selectedGame)
        roleInPickerDelegate  = PickerDelegate(strings: gameRoles.roles, textField: roleINTxtField)
        roleINpicker.delegate = roleInPickerDelegate
        roleINpicker.dataSource = roleInPickerDelegate
        skillRatingDelegate  = PickerDelegate(strings: gameRoles.skills, textField: skillRatingTxtField)
        skillRatingPicker.delegate = skillRatingDelegate
        skillRatingPicker.dataSource = skillRatingDelegate
        memberSizeDelegate = PickerDelegate(strings: gameRoles.teamMembers, textField: memberSizeTxtField)
        membersizePicker.delegate = memberSizeDelegate
        membersizePicker.dataSource = memberSizeDelegate
        rolePickerDelegate = PickerDelegate(strings: gameRoles.roles, textField: roleTxtField)
        rolePicker.delegate = rolePickerDelegate
        rolePicker.dataSource = rolePickerDelegate
    }

    func setPickerColor(picker : UIPickerView){
        picker.setValue(UIColor.white, forKey: "textColor")
        picker.setValue(UIColor.black, forKey: "backgroundColor")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

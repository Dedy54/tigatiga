//
//  AddPostPlayerVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 10/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class AddPostLFMemberVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var teamNameTextfield: UITextField!
    @IBOutlet weak var skillRatingTextfield: UITextField!
    @IBOutlet weak var roleTextfield: UITextField!
    
    @IBOutlet weak var descriptionTextview: UITextView!
    
    var test = ["a","b","c"]
  
    let skillRatingPicker = UIPickerView()
    let rolePicker = UIPickerView()
    
     let playerInteractor: PlayerInteractor? = PlayerInteractor()
    var selectedPeople: Player?
    let gameRoles = SwitchGame()
    var rolePlayerDelegate: PickerDelegate?
    var skillRatingPlayerDelegate: PickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .dark
        
        
        teamNameTextfield.layer.borderWidth = 1
        teamNameTextfield.layer.borderColor = searchForTeamVC().mabarYellow
        teamNameTextfield.layer.cornerRadius = 5
        teamNameTextfield.frame.size.height = 44
        
        setTextFieldShape(txtfld: skillRatingTextfield)
        setTextFieldShape(txtfld: roleTextfield)
        setTextFieldShape(txtfld: teamNameTextfield)
        
        skillRatingPicker.tag = 1
        rolePicker.tag = 2
        
        skillRatingTextfield.inputView = skillRatingPicker
        roleTextfield.inputView = rolePicker
        
        
        setPickerColor(picker: skillRatingPicker)
        setPickerColor(picker: rolePicker)
        
        skillRatingPicker.dataSource = self
        skillRatingPicker.delegate = self
        rolePicker.dataSource = self
        rolePicker.delegate = self
        
        descriptionTextview.layer.cornerRadius = 5
        descriptionTextview.layer.borderWidth = 1
        descriptionTextview.layer.borderColor = searchForTeamVC().mabarYellow
        
        preparePicker()
        
    }
    
    func preparePicker() {
       playerInteractor?.currentPlayer(success: { (playerResult) -> (Void) in
        self.gameRoles.setTitle(playerResult.game ?? GameTitle.Valorant.rawValue)
            self.rolePlayerDelegate = PickerDelegate(strings: self.gameRoles.roles, textField: self.roleTextfield)
            self.rolePicker.delegate = self.rolePlayerDelegate
            self.rolePicker.dataSource = self.rolePlayerDelegate
            self.skillRatingPlayerDelegate = PickerDelegate(strings: self.gameRoles.skills, textField: self.skillRatingTextfield)
            self.skillRatingPicker.delegate = self.skillRatingPlayerDelegate
            self.skillRatingPicker.dataSource = self.skillRatingPlayerDelegate
        }, failure: { (err) -> (Void) in
            print("failed to current player data with error \(err)")
        })
    }

    func setTextFieldShape(txtfld : UITextField){
        txtfld.layer.borderWidth = 1
        txtfld.layer.borderColor = searchForTeamVC().mabarYellow
        txtfld.layer.cornerRadius = 5
        txtfld.frame.size.height = 44
        txtfld.tintColor = .clear
    }
    func setPickerColor(picker : UIPickerView){
        picker.setValue(UIColor.white, forKey: "textColor")
        picker.setValue(UIColor.black, forKey: "backgroundColor")
    }
    
    

}

extension AddPostLFMemberVC: UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
            case 1:
                return test.count
            case 2:
                return test.count
            default:
                return 1
            }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
            case 1:
                return test[row]
            case 2:
                return test[row]
            default:
                return "no data"
            }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
            case 1:
                skillRatingTextfield.text = test[row]
            case 2:
                roleTextfield.text = test[row]
            default:
                break
            }
    }
    
}

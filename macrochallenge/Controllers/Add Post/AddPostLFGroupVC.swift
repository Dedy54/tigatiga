//
//  AddPostTeamVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 10/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class AddPostLFGroupVC: UIViewController {

    
    @IBOutlet weak var avgSkillRatingTextfield: UITextField!
    @IBOutlet weak var roleTextfield: UITextField!
    @IBOutlet weak var availability: UITextField!
    
    @IBOutlet weak var descriptionTextview: UITextView!
    
    
    @IBOutlet weak var avgSRTitleLabel: UILabel!
    
    @IBOutlet weak var roleTitleLabel: UILabel!
    
    @IBOutlet weak var avTitleLabel: UILabel!
    
    @IBOutlet weak var descTitleLabel: UILabel!
    
    
    let avgSkillRatingPicker = UIPickerView()
    let rolePicker = UIPickerView()
    
    var test = ["a","b","c"]
    
    var selectedPeople: Player?
    let gameRoles = SwitchGame()
    var rolePlayerDelegate: PickerDelegate?
    var skillRatingPlayerDelegate: PickerDelegate?
    let playerInteractor: PlayerInteractor? = PlayerInteractor()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextview.layer.cornerRadius = 5
        descriptionTextview.layer.borderWidth = 1
        descriptionTextview.layer.borderColor = searchForTeamVC().mabarYellow
        
        setTextFieldShape(txtfld: avgSkillRatingTextfield)
        setTextFieldShape(txtfld: roleTextfield)
        
        availability.layer.borderWidth = 1
        availability.layer.borderColor = searchForTeamVC().mabarYellow
        availability.layer.cornerRadius = 5
        availability.frame.size.height = 44
        
        
        avgSkillRatingPicker.tag = 1
        rolePicker.tag = 2
        
        avgSkillRatingTextfield.inputView = avgSkillRatingPicker
        roleTextfield.inputView = rolePicker
        
        
        AddPostLFMemberVC().setPickerColor(picker: avgSkillRatingPicker)
        AddPostLFMemberVC().setPickerColor(picker: rolePicker)
        
        avgSkillRatingPicker.dataSource = self
        avgSkillRatingPicker.delegate = self
        rolePicker.dataSource = self
        rolePicker.delegate = self
        
        avgSRTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        roleTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        avTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        descTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        
        preparePicker()
        
    }
    
    func preparePicker() {
       playerInteractor?.currentPlayer(success: { (playerResult) -> (Void) in
            self.gameRoles.setTitle(playerResult.game!)
            self.rolePlayerDelegate = PickerDelegate(strings: self.gameRoles.roles, textField: self.roleTextfield)
            self.rolePicker.delegate = self.rolePlayerDelegate
            self.rolePicker.dataSource = self.rolePlayerDelegate
            self.skillRatingPlayerDelegate = PickerDelegate(strings: self.gameRoles.skills, textField: self.avgSkillRatingTextfield)
            self.avgSkillRatingPicker.delegate = self.skillRatingPlayerDelegate
            self.avgSkillRatingPicker.dataSource = self.skillRatingPlayerDelegate
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

}

extension AddPostLFGroupVC : UIPickerViewDelegate,UIPickerViewDataSource{
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
                avgSkillRatingTextfield.text = test[row]
            case 2:
                roleTextfield.text = test[row]
            default:
                break
            }
    }
    
}

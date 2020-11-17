//
//  FilterPostViewController.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 06/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class FilterPostViewController: UIViewController {

    @IBOutlet weak var lookingForTextField: UITextField!
    @IBOutlet weak var skillRatingTextField: UITextField!
    @IBOutlet weak var roleTextField: UITextField!
    @IBOutlet weak var availabilityTexTField: UITextField!
    
    @IBOutlet weak var applyButton: UIButton!
    
    
    @IBOutlet weak var LFTitleLabel: UILabel!
    @IBOutlet weak var SRTitleLabel: UILabel!
    @IBOutlet weak var RoleTitleLabel: UILabel!
    
    let lookingForPickerview = UIPickerView()
    let skillRatingPickerview = UIPickerView()
    let rolePickerview = UIPickerView()
    
    var selectedPeople: Player?
    let gameRoles = SwitchGame()
    var rolePlayerDelegate: PickerDelegate?
    var skillRatingPlayerDelegate: PickerDelegate?
    let playerInteractor: PlayerInteractor? = PlayerInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .dark
        self.hideKeyboardWhenTappedAround()
        
        setTextFieldShape(txtfld: lookingForTextField)
        setTextFieldShape(txtfld: skillRatingTextField)
        setTextFieldShape(txtfld: roleTextField)
        
        setPickerviewDelagate()
        
        lookingForPickerview.tag = 1
        skillRatingPickerview.tag = 2
        rolePickerview.tag = 3
        
        lookingForTextField.inputView = lookingForPickerview
        skillRatingTextField.inputView = skillRatingPickerview
        roleTextField.inputView = rolePickerview
        
        applyButton.layer.cornerRadius = 20
        applyButton.titleLabel?.font = UIFont(name: "Hind-Bold", size: 16)
        
        LFTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        SRTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        RoleTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        
        preparePicker()
        
    }
    
    func preparePicker() {
       playerInteractor?.currentPlayer(success: { (playerResult) -> (Void) in
            self.gameRoles.setTitle(playerResult.game!)
            self.rolePlayerDelegate = PickerDelegate(strings: self.gameRoles.roles, textField: self.roleTextField)
            self.rolePickerview.delegate = self.rolePlayerDelegate
            self.rolePickerview.dataSource = self.rolePlayerDelegate
            self.skillRatingPlayerDelegate = PickerDelegate(strings: self.gameRoles.skills, textField: self.skillRatingTextField)
            self.skillRatingPickerview.delegate = self.skillRatingPlayerDelegate
            self.skillRatingPickerview.dataSource = self.skillRatingPlayerDelegate
        }, failure: { (err) -> (Void) in
            print("failed to current player data with error \(err)")
        })
    }
    
    func setPickerviewDelagate(){
        lookingForPickerview.delegate = self
        lookingForPickerview.dataSource = self
        skillRatingPickerview.delegate = self
        skillRatingPickerview.dataSource = self
        rolePickerview.delegate = self
        rolePickerview.dataSource = self
    }
    
    func setTextFieldShape(txtfld : UITextField){
        txtfld.layer.borderWidth = 1
        txtfld.layer.borderColor = searchForTeamVC().mabarYellow
                txtfld.layer.cornerRadius = 5
        txtfld.frame.size.height = 44
        txtfld.tintColor = .clear
    }
    
    
    @IBAction func applyTapped(_ sender: Any) {
    }
    

}

extension FilterPostViewController : UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return 3
        case 2:
            return 3
        case 3:
            return 3
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            return lookingForTextField.text = ""
        case 2:
            skillRatingTextField.text = ""
        case 3:
            roleTextField.text = ""
        default:
            return 
        }
        
        
        
    }
    
    
}


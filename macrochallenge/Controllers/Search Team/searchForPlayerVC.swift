//
//  searchForPlayerVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 26/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class searchForPlayerVC: UIViewController, UITextFieldDelegate {

//    @IBOutlet weak var awesomeBtn: UIButton!
//    @IBOutlet weak var greatBtn: UIButton!
//    @IBOutlet weak var teamLeaderBtn: UIButton!
//    @IBOutlet weak var friendlyBtn: UIButton!
    
    
    @IBOutlet var commendationButton: [UIButton]!
    
    
    
    @IBOutlet weak var searchPlayerTxtField: UITextField!
    
    @IBOutlet weak var skillRatingPlayerTextField: UITextField!
    
    @IBOutlet weak var rolePlayerTextField: UITextField!
    @IBOutlet weak var commendationView: UIView!
    
    var skillRatingPlayerPickerView = UIPickerView()
    var rolePlayerPickerView = UIPickerView()
    var test = ["abc","dsa","afeg","asdads","asdads"]
    
    var mabarYellowTranspararent = UIColor(hex: "#ffce0032")
    
    
    @IBOutlet weak var cmdTitleLabel: UILabel!
    @IBOutlet weak var roleTitleLabel: UILabel!
    @IBOutlet weak var srTitleLabel: UILabel!
    
    let gameRoles = SwitchGame()
    var rolePlayerDelegate: PickerDelegate?
    var skillRatingPlayerDelegate: PickerDelegate?
    let playerInteractor: PlayerInteractor? = PlayerInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSearchShape()
        searchPlayerTxtField.delegate = self
        
//        awesomeBtn.layer.cornerRadius = 5
//        greatBtn.layer.cornerRadius = 5
//        teamLeaderBtn.layer.cornerRadius = 5
//        friendlyBtn.layer.cornerRadius = 5

        commendationView.layer.borderColor = searchForTeamVC().mabarYellow
        commendationView.layer.borderWidth = 1
        commendationView.layer.cornerRadius = 5
        
        
        searchForTeamVC().setTextFieldShape2(txtfld: skillRatingPlayerTextField)
        searchForTeamVC().setTextFieldShape2(txtfld: rolePlayerTextField)
        
        skillRatingPlayerTextField.inputView = skillRatingPlayerPickerView
        rolePlayerTextField.inputView = rolePlayerPickerView
        
        preparePicker()
        
        skillRatingPlayerPickerView.tag = 1
        rolePlayerPickerView.tag = 2
        
        searchForTeamVC().setPickerColor(picker: skillRatingPlayerPickerView)
        searchForTeamVC().setPickerColor(picker: rolePlayerPickerView)
        
        cmdTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        srTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        roleTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        
        
    }
    
    func preparePicker() {
        playerInteractor?.currentPlayer(success: { (playerResult) -> (Void) in
            self.gameRoles.setTitle(playerResult.game ?? "")
            self.rolePlayerDelegate = PickerDelegate(strings: self.gameRoles.roles, textField: self.rolePlayerTextField)
            self.rolePlayerPickerView.delegate = self.rolePlayerDelegate
            self.rolePlayerPickerView.dataSource = self.rolePlayerDelegate
            self.skillRatingPlayerDelegate = PickerDelegate(strings: self.gameRoles.skills, textField: self.skillRatingPlayerTextField)
            self.skillRatingPlayerPickerView.delegate = self.skillRatingPlayerDelegate
            self.skillRatingPlayerPickerView.dataSource = self.skillRatingPlayerDelegate
        }, failure: { (err) -> (Void) in
            print("failed to current player data with error \(err)")
        })
    }
    
    @objc func actionAwesomeBtn(_ sender: UIButton) {
        print("aaaa")
    }

    func setSearchShape(){
        searchPlayerTxtField.layer.borderWidth = 1
        searchPlayerTxtField.layer.borderColor = searchForTeamVC().mabarYellow
        searchPlayerTxtField.layer.cornerRadius = 5
        searchPlayerTxtField.frame.size.height = 44
        
        let imageView = UIImageView()
        let image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = UIColor(hex: "#ebebf599")
        imageView.image = image
        searchPlayerTxtField.leftView = imageView
        searchPlayerTxtField.leftViewMode = .always
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
  
    
    @IBAction func commendationTapped(_ sender: UIButton) {
        commendationButton.forEach({
            $0.backgroundColor = nil
        })
        sender.backgroundColor = mabarYellowTranspararent
        sender.layer.cornerRadius = 10
        
    }
    
//    @IBAction func awesomeTapped(_ sender: UIButton) {
//        print("abc")
//        sender.isSelected = !sender.isSelected
//
//        if sender.isSelected{
//            sender.backgroundColor = mabarYellowTranspararent
//        }
//        else{
//            sender.backgroundColor = nil
//        }
//    }
//
//
//    @IBAction func greatTouched(_ sender: UIButton) {
//        sender.isSelected = !sender.isSelected
//
//        if sender.isSelected{
//            sender.backgroundColor = mabarYellowTranspararent
//        }
//        else{
//            sender.backgroundColor = nil
//        }
//    }
//
//    @IBAction func teamLeaderTouched(_ sender: UIButton) {
//        sender.isSelected = !sender.isSelected
//
//        if sender.isSelected{
//            sender.backgroundColor = mabarYellowTranspararent
//        }
//        else{
//            sender.backgroundColor = nil
//        }
//    }
//    @IBAction func friendlyTouched(_ sender: UIButton) {
//        sender.isSelected = !sender.isSelected
//
//        if sender.isSelected{
//            sender.backgroundColor = mabarYellowTranspararent
//        }
//        else{
//            sender.backgroundColor = nil
//        }
//    }
//
}

extension searchForPlayerVC : UIPickerViewDelegate,UIPickerViewDataSource{
    
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
            skillRatingPlayerTextField.text = test[row]
        case 2:
            rolePlayerTextField.text = test[row]
        default:
            return
        }
    }
    
}




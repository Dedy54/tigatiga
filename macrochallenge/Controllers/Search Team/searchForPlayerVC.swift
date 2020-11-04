//
//  searchForPlayerVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 26/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class searchForPlayerVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var awesomeBtn: UIButton!
    @IBOutlet weak var greatBtn: UIButton!
    @IBOutlet weak var teamLeaderBtn: UIButton!
    @IBOutlet weak var friendlyBtn: UIButton!
    @IBOutlet weak var searchPlayerTxtField: UITextField!
    
    @IBOutlet weak var skillRatingPlayerTextField: UITextField!
    
    @IBOutlet weak var rolePlayerTextField: UITextField!
    @IBOutlet weak var commendationView: UIView!
    
    var skillRatingPlayerPickerView = UIPickerView()
    var rolePlayerPickerView = UIPickerView()
    var test = ["abc","dsa","afeg","asdads","asdads"]
    
    var mabarYellowTranspararent = UIColor(hex: "#ffce000a")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSearchShape()
        searchPlayerTxtField.delegate = self
        
        awesomeBtn.layer.cornerRadius = 5
        greatBtn.layer.cornerRadius = 5
        teamLeaderBtn.layer.cornerRadius = 5
        friendlyBtn.layer.cornerRadius = 5

        commendationView.layer.borderColor = searchForTeamVC().mabarYellow
        commendationView.layer.borderWidth = 1
        commendationView.layer.cornerRadius = 5
        
        
        searchForTeamVC().setTextFieldShape2(txtfld: skillRatingPlayerTextField)
        searchForTeamVC().setTextFieldShape2(txtfld: rolePlayerTextField)
        
        rolePlayerPickerView.delegate = self
        rolePlayerPickerView.dataSource = self
        skillRatingPlayerPickerView.delegate = self
        skillRatingPlayerPickerView.dataSource = self
        
        skillRatingPlayerPickerView.tag = 1
        rolePlayerPickerView.tag = 2
        
        skillRatingPlayerTextField.inputView = skillRatingPlayerPickerView
        rolePlayerTextField.inputView = rolePlayerPickerView
        
        searchForTeamVC().setPickerColor(picker: skillRatingPlayerPickerView)
        searchForTeamVC().setPickerColor(picker: rolePlayerPickerView)
        
        
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
  
    
    
    @IBAction func awesomeTapped(_ sender: UIButton) {
        print("abc")
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            sender.backgroundColor = mabarYellowTranspararent
        }
        else{
            sender.backgroundColor = nil
        }
    }
    
    
    @IBAction func greatTouched(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            sender.backgroundColor = mabarYellowTranspararent
        }
        else{
            sender.backgroundColor = nil
        }
    }
    
    @IBAction func teamLeaderTouched(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            sender.backgroundColor = mabarYellowTranspararent
        }
        else{
            sender.backgroundColor = nil
        }
    }
    @IBAction func friendlyTouched(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            sender.backgroundColor = mabarYellowTranspararent
        }
        else{
            sender.backgroundColor = nil
        }
    }
    
}

extension UIButton {
    
    func centerVertically(padding: CGFloat = 6.0) {
        guard
            let imageViewSize = self.imageView?.frame.size,
            let titleLabelSize = self.titleLabel?.frame.size else {
            return
        }
        
        let totalHeight = imageViewSize.height + titleLabelSize.height + padding
        
        self.imageEdgeInsets = UIEdgeInsets(
            top: max(0, -(totalHeight - imageViewSize.height)),
            left: 0.0,
            bottom: 0.0,
            right: -titleLabelSize.width
        )
        
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: -imageViewSize.width,
            bottom: -(totalHeight - titleLabelSize.height),
            right: 0.0
        )
        
        self.contentEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: 0.0,
            bottom: titleLabelSize.height,
            right: 0.0
        )
    }
    
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




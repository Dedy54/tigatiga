//
//  AvailabilityViewController.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 07/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class AvailabilityVC: UIViewController{
    
    
    @IBOutlet weak var dayTextfield: UITextField!
    @IBOutlet weak var startTextfield: UITextField!
    @IBOutlet weak var endTextfield: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    
    @IBOutlet weak var dayTitleLabel: UILabel!
    @IBOutlet weak var startTitleLabel: UILabel!
    @IBOutlet weak var endTitleLabel: UILabel!
    
    let day = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    let hour = Array(0...23)
    let minute = Array(0...59)
    
    let dayPicker = UIPickerView()
    var startPicker = UIPickerView()
    let endPicker = UIPickerView()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .dark
        self.hideKeyboardWhenTappedAround()
        dayTextfield.inputView = dayPicker
        
        startTextfield.inputView = startPicker
        endTextfield.inputView = endPicker
        
        pickerDelegate()
        
        dayPicker.tag = 1
        startPicker.tag = 2
        endPicker.tag = 3
        
        setTextFieldShape(txtfld: dayTextfield)
        setTextFieldShape(txtfld: startTextfield)
        setTextFieldShape(txtfld: endTextfield)
        
        setPickerColor(picker: dayPicker)
        setPickerColor(picker: startPicker)
        setPickerColor(picker: endPicker)
        
        addButton.layer.cornerRadius = 20
        
        dayTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        startTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        endTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        
    }
    
    
    func setTextFieldShape(txtfld : UITextField){
        txtfld.layer.borderWidth = 1
        txtfld.layer.borderColor = searchForTeamVC().mabarYellow
                txtfld.layer.cornerRadius = 5
        txtfld.frame.size.height = 44
        txtfld.tintColor = .clear
    }
    
    func pickerDelegate(){
        dayPicker.delegate = self
        dayPicker.dataSource = self
        startPicker.delegate = self
        startPicker.dataSource = self
        endPicker.delegate = self
        endPicker.dataSource = self
    }
    
    
    
    func setPickerColor(picker : UIPickerView){
        picker.setValue(UIColor.white, forKey: "textColor")
        picker.setValue(UIColor.black, forKey: "backgroundColor")
    }
    
    
}
    
extension AvailabilityVC : UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView.tag {
        case 1:
            return 1
        case 2,3:
            return 2
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return day.count
        case 2:
            if component == 0 {
                return hour.count
            }
            else if component == 1{
                return minute.count
            }
            else {
                return 1
            }
        case 3:
            if component == 0 {
                return hour.count
            }
            else if component == 1{
                return minute.count
            }
            else{
                return 1
            }
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return day[row]
        case 2:
            if component == 0 {
                return String(hour[row])
            }
            else if component == 1{
                if minute[row] < 10 {
                    return "0" + String(minute[row])
                }
                else{
                    return String(minute[row])
                }
            }
            else{
                return "no data"
            }
        case 3:
            if component == 0 {
                return String(hour[row])
            }
            else if component == 1{
                if minute[row] < 10 {
                    return "0" + String(minute[row])
                }
                else{
                    return String(minute[row])
                }
            }
            else{
                return "no data"
            }
        default:
            return "no data"
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            dayTextfield.text = day[row]
        case 2:
            let startHourSelected = hour[pickerView.selectedRow(inComponent: 0)]
            let startMinuteSelected = minute[pickerView.selectedRow(inComponent: 1)]
            
            if startMinuteSelected < 10{
                startTextfield.text = String(startHourSelected) + ":0" + String(startMinuteSelected)
            }
            else{
                startTextfield.text = String(startHourSelected) + ":" + String(startMinuteSelected)
            }
            
        case 3:
            let endHourSelected = hour[pickerView.selectedRow(inComponent: 0)]
            let endMinuteSelected = minute[pickerView.selectedRow(inComponent: 1)]
            
            if endMinuteSelected < 10{
                endTextfield.text = String(endHourSelected) + ":0" + String(endMinuteSelected)
            }
            else{
                endTextfield.text = String(endHourSelected) + ":" + String(endMinuteSelected)
            }
        default:
            break
        }
    }


}

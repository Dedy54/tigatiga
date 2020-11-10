//
//  PickerDelegate.swift
//  macrochallenge
//
//  Created by Bryanza on 04/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import UIKit

class PickerDelegate: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    var strings: [String] = []
    
    var textField: UITextField

    init(strings: [String], textField: UITextField) {
        self.strings = strings
        self.textField = textField
        super.init()
    }
    
    func set(strings: [String]) {
         self.strings = strings
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return strings.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return strings[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = strings[row]
    }
}

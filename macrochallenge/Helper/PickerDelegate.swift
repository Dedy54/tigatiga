//
//  PickerDelegate.swift
//  macrochallenge
//
//  Created by Bryanza on 04/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import UIKit

class PickerDelegate: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    var strings: [String] = []

//    init(strings: [String]) {
//        self.strings = strings
//        super.init()
//    }
    
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
}

//
//  profileForMeVC.swift
//  macrochallenge
//
//  Created by Bryanza on 11/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class profileForMeVC: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var profileBackground: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileGame: UILabel!
    @IBOutlet weak var profileSkill: UILabel!
    @IBOutlet weak var profileRole: UILabel!
    @IBOutlet weak var profileJoin: UILabel!
    @IBOutlet weak var profileExperience: UITextField!
    
    override func awakeFromNib() {
       super.awakeFromNib()
   }

}

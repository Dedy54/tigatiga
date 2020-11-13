//
//  profileForMyTeamVC.swift
//  macrochallenge
//
//  Created by Bryanza on 12/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import UIKit

class profileForMyTeamVC: UITableViewCell {
    
    
    @IBOutlet weak var teamBackground: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamSkill: UILabel!
    @IBOutlet weak var teamMember: UILabel!
    @IBOutlet weak var teamCreated: UILabel!
    
     override func awakeFromNib() {
        super.awakeFromNib()
    }
}

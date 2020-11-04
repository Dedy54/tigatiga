//
//  ResultTableViewCell.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 02/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var profilePicResult: UIImageView!
    @IBOutlet weak var resultNameLabel: UILabel!
    @IBOutlet weak var skillRatingResultLabel: UILabel!
    @IBOutlet weak var roleResultLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    

}

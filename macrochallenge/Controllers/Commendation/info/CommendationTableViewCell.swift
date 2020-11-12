//
//  CommendationTableViewCell.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 13/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class CommendationTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cmdImage: UIImageView!
    @IBOutlet weak var commedationTitle: UILabel!
    @IBOutlet weak var cmdDescription: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

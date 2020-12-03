//
//  PostTableViewCell.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 05/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postView: UIView!
    @IBOutlet weak var feedProfileImage: UIImageView!
    
    @IBOutlet weak var feedNameLabel: UILabel!
    @IBOutlet weak var feedLookingForLabel: UILabel!
    @IBOutlet weak var skillRatingLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var availibilityLabel: UILabel!
    
    
    @IBOutlet weak var skillRatingTitleLabel: UILabel!
    
    @IBOutlet weak var roleTitleLabel: UILabel!
    @IBOutlet weak var availabilityTitleLabel: UILabel!
    
    @IBOutlet var starImageOutlet: [UIImageView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

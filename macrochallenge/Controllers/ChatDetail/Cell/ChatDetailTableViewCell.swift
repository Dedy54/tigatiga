//
//  ChatDetailTableViewCell.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 18/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class ChatDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var imagePerson: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    
    var chatData: ChatData?{
        didSet{
            if let chatData = chatData {
                self.labelText.text = chatData.text
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

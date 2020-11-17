//
//  ChatCollectionViewCell.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 16/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class ChatCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var chatRoom: RoomChat? {
        didSet{
            if let chatRoom = chatRoom {
                self.titleLabel.text = chatRoom.players?[0].name
                self.subtitleLabel.text = "Hi There!"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

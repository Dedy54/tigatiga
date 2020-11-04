//
//  RoomChat.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 04/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct RoomChat: Codable {
    var id: String?
    var name: String?
    var chatData: [ChatData]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case chatData
    }
}

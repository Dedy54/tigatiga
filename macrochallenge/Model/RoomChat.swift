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
    var playerIds: [String]?
    var players: [Player]?
    var chatData: [ChatData]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case playerIds
        case players
        case chatData
    }
}

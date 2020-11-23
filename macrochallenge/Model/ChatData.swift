//
//  ChatData.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 04/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct ChatData: Codable {
    var id: String?
    var playerId: String?
    var text: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case playerId
        case text
    }
}

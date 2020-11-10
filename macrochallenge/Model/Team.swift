//
//  Team.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 26/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct Team: Codable {
    var id: String?
    var name: String?
    var description: String?
    var members: [Player]?
    var maxMember: Int?
    var skillRating: Int?
    var game: Int?
    var dateCreated: Date?
    var lookingForMember: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case members
        case maxMember
        case skillRating
        case game
        case dateCreated
        case lookingForMember
    }
}

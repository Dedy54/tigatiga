//
//  Player.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 26/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct Player: Codable {
    
    var id: String?
    var name: String?
    var experience: String?
    var commendations: [Commendation]?
    var lookingForGroup: Bool?
    var imageProfile: String?
    var user: Users?
    var skillRating: String?
    var role: String?
    var game: String?
    var teams: [Team]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case experience
        case commendations
        case lookingForGroup
        case imageProfile
        case user
        case skillRating
        case role
        case game
        case teams
    }
}

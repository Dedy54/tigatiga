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
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case experience
        case commendations
        case lookingForGroup
        case imageProfile
        case user
    }
}

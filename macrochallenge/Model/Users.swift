//
//  Users.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 22/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct Users: Codable {
    var email: String?
    var uid: String?
    var name: String?
    var roomChat: [String]?
    
    enum CodingKeys: String, CodingKey {
        case email
        case uid
        case name
    }
}

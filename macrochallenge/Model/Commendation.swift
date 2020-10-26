//
//  Commendation.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 26/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct Commendation: Codable {
    var id: String?
    
    enum CodingKeys: String, CodingKey {
        case id
    }
}

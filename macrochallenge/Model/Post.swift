//
//  Post.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 02/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct Post: Codable {
    var id: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

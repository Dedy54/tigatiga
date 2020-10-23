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
  let email: String
    
    enum CodingKeys: String, CodingKey {
      case email
    }
}

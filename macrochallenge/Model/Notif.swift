//
//  Notif.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 02/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

enum NotificationType: String {
    case invite = "invite"
    case join = "join"
}

struct Notif: Codable {
    var id: String?
    var name: String?
    var uid: String?
    var isRead: Bool?
    var type: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case uid
        case isRead
        case type
    }
    
    var typeEnum: NotificationType? {
        switch self.type {
        case NotificationType.invite.rawValue:
            return NotificationType.invite
        case NotificationType.join.rawValue:
            return NotificationType.join
        default:
            return .none
        }
    }
}

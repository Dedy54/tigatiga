//
//  UserInteractor.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 22/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase

class UserInteractor: BaseInteractor {
    
    var users: [Users] = []
    
    func fetchUsers(success: @escaping ([Users]) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchUsers(success: { (users) -> (Void) in
            print("users : \(users)")
            self.users = users
        }) { (error) -> (Void) in
            print("users : \(error)")
        }
    }
    
}

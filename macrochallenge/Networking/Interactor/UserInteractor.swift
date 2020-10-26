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
    var user: Users = Users()
    
    func fetchUsers(success: @escaping ([Users]) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchUsers(success: { (users) -> (Void) in
            print("users : \(users)")
            self.users = users
            success(users)
        }) { (error) -> (Void) in
            print("users : \(error)")
            failure(error)
        }
    }
    
    func fetchCurrentUser(success: @escaping (Users) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchCurrentUser(success: { (user) -> (Void) in
            self.user = user
            success(user)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func fetchUser(email: String, success: @escaping (Users) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchUser(email: email, success: { (user) -> (Void) in
            self.user = user
            success(user)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func createUser(users: Users, success: @escaping (Users) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.createUser(users: users, success: { (users) -> (Void) in
            self.user = users
            success(users)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func updateUser(users: Users, success: @escaping (Users) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.updateUser(users: users, success: { (user) -> (Void) in
            self.user = user
            success(user)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
}

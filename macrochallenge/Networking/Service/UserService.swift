//
//  UserService.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 22/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

extension CoreService {
    
    func fetchUsers(success: @escaping ([Users]) -> (Void), failure: @escaping (Error) -> (Void)) {
        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                failure(error)
                return
            }
            
            var users = [Users]()
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            users = documents.compactMap { queryDocumentSnapshot -> Users? in
                return try? queryDocumentSnapshot.data(as: Users.self)
            }
            
            success(users)
        }
    }
    
    func fetchCurrentUser(success: @escaping (Users) -> (Void), failure: @escaping (Error) -> (Void)) {
        let uid = Auth.auth().currentUser?.uid
        var users = [Users]()
        db.collection("users")
            .whereField("uid", isEqualTo: uid ?? "0")
            .addSnapshotListener { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    users = querySnapshot.documents.compactMap { document in
                        try? document.data(as: Users.self)
                    }
                    if users.count != 0 {
                        success(users[0])
                        return
                    }
                    
                    success(Users())
                }
                
                if let error = error {
                    failure(error)
                    return
                }
        }
    }
    
    func fetchUser(email: String, success: @escaping (Users) -> (Void), failure: @escaping (Error) -> (Void)) {
        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                failure(error)
                return
            }
            
            var users = [Users]()
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            users = documents.compactMap { queryDocumentSnapshot -> Users? in
                return try? queryDocumentSnapshot.data(as: Users.self)
            }
            
            if users.count != 0 {
                success(users[0])
                return
            }
            
            success(Users())
        }
    }
    
    func createUser(users: Users, success: @escaping (Users) -> (Void), failure: @escaping (Error) -> (Void)) {
        do {
            let uid = Auth.auth().currentUser?.uid ?? ""
            var addedUsers = users
            addedUsers.uid = uid
            let _ = try db.collection("users").document(uid).setData(from: addedUsers)
            success(users)
            return
        } catch {
            failure(error)
            return
        }
    }
    
    func updateUser(users: Users, success: @escaping (Users) -> (Void), failure: @escaping (Error) -> (Void)) {
        if let uid = users.uid {
            do {
                try db.collection("users").document(uid).setData(from: users)
                success(users)
            } catch {
                failure(error)
                return
            }
        }
    }
    
}

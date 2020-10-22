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
    
}

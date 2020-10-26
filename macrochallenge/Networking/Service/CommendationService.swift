//
//  CommendationService.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 26/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

extension CoreService {
    
    func fetchCommendations(success: @escaping ([Commendation]) -> (Void), failure: @escaping (Error) -> (Void)) {
        db.collection("commendations").addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                failure(error)
                return
            }
            
            var commendations = [Commendation]()
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            commendations = documents.compactMap { queryDocumentSnapshot -> Commendation? in
                return try? queryDocumentSnapshot.data(as: Commendation.self)
            }
            
            success(commendations)
        }
    }
    
    func fetchCommendations(id: String, success: @escaping (Commendation) -> (Void), failure: @escaping (Error) -> (Void)) {
        var commendations = [Commendation]()
        db.collection("teams")
            .whereField("id", isEqualTo: id)
            .addSnapshotListener { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    commendations = querySnapshot.documents.compactMap { document in
                        try? document.data(as: Commendation.self)
                    }
                    if commendations.count != 0 {
                        success(commendations[0])
                        return
                    }
                    
                    success(Commendation())
                }
                
                if let error = error {
                    failure(error)
                    return
                }
        }
        
    }
    
    func createCommendation(commendation: Commendation, success: @escaping (Commendation) -> (Void), failure: @escaping (Error) -> (Void)) {
        do {
            let id = db.collection("commendations").document().documentID
            var addedCommendations = commendation
            addedCommendations.id = id
            let _ = try db.collection("commendations").document(id).setData(from: addedCommendations)
            success(commendation)
            return
        } catch {
            failure(error)
            return
        }
    }
    
    func updateCommendation(commendation: Commendation, success: @escaping (Commendation) -> (Void), failure: @escaping (Error) -> (Void)) {
        if let id = commendation.id {
            do {
                try db.collection("commendations").document(id).setData(from: commendation)
                success(commendation)
            } catch {
                failure(error)
                return
            }
        }
    }
    
}

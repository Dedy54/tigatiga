//
//  NotifService.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 02/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol NotifServiceDelegate {
    func fetchNotifs(success: @escaping ([Notif]) -> (Void), failure: @escaping (Error) -> (Void))
    func fetchNotif(id: String, success: @escaping (Notif) -> (Void), failure: @escaping (Error) -> (Void))
    func createNotif(notif: Notif, success: @escaping (Notif) -> (Void), failure: @escaping (Error) -> (Void))
    func updateNotif(notif: Notif, success: @escaping (Notif) -> (Void), failure: @escaping (Error) -> (Void))
}

extension CoreService: NotifServiceDelegate {
    func fetchNotifs(success: @escaping ([Notif]) -> (Void), failure: @escaping (Error) -> (Void)) {
        db.collection("notifs").addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                failure(error)
                return
            }
            
            var notifs = [Notif]()
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            notifs = documents.compactMap { queryDocumentSnapshot -> Notif? in
                return try? queryDocumentSnapshot.data(as: Notif.self)
            }
            
            success(notifs)
        }
    }
    
    func fetchNotif(id: String, success: @escaping (Notif) -> (Void), failure: @escaping (Error) -> (Void)) {
        var notifs = [Notif]()
        db.collection("notifs")
            .whereField("id", isEqualTo: id)
            .addSnapshotListener { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    notifs = querySnapshot.documents.compactMap { document in
                        try? document.data(as: Notif.self)
                    }
                    if notifs.count != 0 {
                        success(notifs[0])
                        return
                    }
                    
                    success(Notif())
                }
                
                if let error = error {
                    failure(error)
                    return
                }
        }
    }
    
    func fetchNotifCurrentUser(success: @escaping ([Notif]) -> (Void), failure: @escaping (Error) -> (Void)) {
        let uid = Auth.auth().currentUser?.uid
        var notifs = [Notif]()
        db.collection("notifs")
            .whereField("uid", isEqualTo: uid ?? "0")
            .addSnapshotListener { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    notifs = querySnapshot.documents.compactMap { document in
                        try? document.data(as: Notif.self)
                    }
                    if notifs.count != 0 {
                        success(notifs)
                        return
                    }
                    
                    success([Notif]())
                }
                
                if let error = error {
                    failure(error)
                    return
                }
        }
    }
    
    func createNotif(notif: Notif, success: @escaping (Notif) -> (Void), failure: @escaping (Error) -> (Void)) {
        do {
            let id = db.collection("notifs").document().documentID
            var addedNotifs = notif
            addedNotifs.id = id
            let _ = try db.collection("notifs").document(id).setData(from: addedNotifs)
            success(notif)
            return
        } catch {
            failure(error)
            return
        }
    }
    
    func updateNotif(notif: Notif, success: @escaping (Notif) -> (Void), failure: @escaping (Error) -> (Void)) {
        if let id = notif.id {
            do {
                try db.collection("notifs").document(id).setData(from: notif)
                success(notif)
            } catch {
                failure(error)
                return
            }
        }
    }
    
}

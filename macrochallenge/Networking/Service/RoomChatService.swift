//
//  RoomChatService.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 04/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol RoomChatServiceDelegate {
    func fetchRoomChatCurrentUser(success: @escaping ([RoomChat]) -> (Void), failure: @escaping (Error) -> (Void))
    func createRoomChat(roomChat: RoomChat, success: @escaping (RoomChat) -> (Void), failure: @escaping (Error) -> (Void))
}

extension CoreService: RoomChatServiceDelegate {
    
    func createRoomChat(roomChat: RoomChat, success: @escaping (RoomChat) -> (Void), failure: @escaping (Error) -> (Void)) {
        do {
            let _ = try db.collection("room_chats").document(roomChat.id ?? "").setData(from: roomChat)
            success(roomChat)
            return
        } catch {
            failure(error)
            return
        }
    }
    
    func fetchRoomChatCurrentUser(success: @escaping ([RoomChat]) -> (Void), failure: @escaping (Error) -> (Void)) {
        let uid = PreferenceManager.instance.uid ?? "0"
        var roomChats = [RoomChat]()
        db.collection("room_chats")
            .whereField("playerIds", arrayContains: uid)
            .addSnapshotListener { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    roomChats = querySnapshot.documents.compactMap { document in
                        try? document.data(as: RoomChat.self)
                    }
                    if roomChats.count != 0 {
                        success(roomChats)
                        return
                    }
                    
                    success([RoomChat]())
                }
                
                if let error = error {
                    failure(error)
                    return
                }
        }
    }
}

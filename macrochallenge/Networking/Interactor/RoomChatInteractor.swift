//
//  RoomChatInteractor.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 04/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol RoomChatInteractorDelegate {
    func fetchRoomChatCurrentUser(success: @escaping ([RoomChat]) -> (Void), failure: @escaping (Error) -> (Void))
    func createRoomChatWith(playerId: String, success: @escaping (RoomChat) -> (Void), failure: @escaping (Error) -> (Void))
    func fetchRoomChat(roomId: String, success: @escaping (RoomChat) -> (Void), failure: @escaping (Error) -> (Void))
    func createChat(roomId: String, text: String, success: @escaping (RoomChat) -> (Void), failure: @escaping (Error) -> (Void))
}

class RoomChatInteractor: BaseInteractor, RoomChatInteractorDelegate {
    
    var roomChats: [RoomChat] = [RoomChat]()
    var roomChat: RoomChat = RoomChat()
    
    func fetchRoomChatCurrentUser(success: @escaping ([RoomChat]) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchRoomChatCurrentUser(success: { (rooms) -> (Void) in
            self.roomChats = rooms
            success(rooms)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func createRoomChatWith(playerId: String, success: @escaping (RoomChat) -> (Void), failure: @escaping (Error) -> (Void)) {
        let playerInteractor = PlayerInteractor()
        playerInteractor.currentPlayer(success: { (currentPlayer) -> (Void) in
            let currentPlayer = currentPlayer
            playerInteractor.fetchPlayer(id: playerId, success: { (otherPlayer) -> (Void) in
                let otherPlayer = otherPlayer
                let id = self.db.collection("room_chats").document().documentID
                let uid = PreferenceManager.instance.uid ?? "0"
                let roomChat = RoomChat(id: id, playerIds: [playerId, uid], players: [otherPlayer, currentPlayer], chatData: nil)
                self.service.createRoomChat(roomChat: roomChat, success: { (roomChat) -> (Void) in
                    self.roomChat = roomChat
                    success(roomChat)
                }) { (error) -> (Void) in
                    failure(error)
                }
            }) { (error) -> (Void) in
                failure(error)
            }
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func fetchRoomChat(roomId: String, success: @escaping (RoomChat) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchRoomChat(roomId: roomId, success: { (roomChat) -> (Void) in
            self.roomChat = roomChat
            success(roomChat)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func createChat(roomId: String, text: String, success: @escaping (RoomChat) -> (Void), failure: @escaping (Error) -> (Void)) {
        let playerInteractor = PlayerInteractor()
        playerInteractor.currentPlayer(success: { (currentPlayer) -> (Void) in
            let chatData = ChatData(id: UUID().uuidString, playerId: currentPlayer.id, text: text)
            self.service.fetchRoomChat(roomId: roomId, success: { (roomChat) -> (Void) in
                self.roomChat = roomChat
                self.roomChat.chatData?.append(chatData)
                self.service.updateRoomChat(roomChat: self.roomChat, success: { (roomChat) -> (Void) in
                    success(self.roomChat)
                }) { (error) -> (Void) in
                    failure(error)
                }
            }) { (error) -> (Void) in
                failure(error)
            }
        }) { (error) -> (Void) in
            failure(error)
        }
    }
}

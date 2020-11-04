//
//  RoomChatInteractor.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 04/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase

protocol RoomChatInteractorDelegate {
    func fetchRoomChats(success: @escaping ([RoomChat]) -> (Void), failure: @escaping (Error) -> (Void))
    func fetchRoomChat(id: String, success: @escaping (RoomChat) -> (Void), failure: @escaping (Error) -> (Void))
    func fetchRoomChatCurrentUser(id: String, success: @escaping ([RoomChat]) -> (Void), failure: @escaping (Error) -> (Void))
    func createRoomChat(success: @escaping (RoomChat) -> (Void), failure: @escaping (Error) -> (Void))
    func createChat(roomChatId: String, text: String, success: @escaping (RoomChat) -> (Void), failure: @escaping (Error) -> (Void))
}

class RoomChatInteractor: BaseInteractor, RoomChatInteractorDelegate {
    
    var roomChats: [RoomChat] = []
    var roomChat: RoomChat = RoomChat()
    
    func fetchRoomChats(success: @escaping ([RoomChat]) -> (Void), failure: @escaping (Error) -> (Void)) {
        
    }
    
    func fetchRoomChat(id: String, success: @escaping (RoomChat) -> (Void), failure: @escaping (Error) -> (Void)) {
        
    }
    
    func fetchRoomChatCurrentUser(id: String, success: @escaping ([RoomChat]) -> (Void), failure: @escaping (Error) -> (Void)) {
        
    }
    
    func createRoomChat(success: @escaping (RoomChat) -> (Void), failure: @escaping (Error) -> (Void)) {
        
    }
    
    func createChat(roomChatId: String, text: String, success: @escaping (RoomChat) -> (Void), failure: @escaping (Error) -> (Void)) {
        
    }
    
}

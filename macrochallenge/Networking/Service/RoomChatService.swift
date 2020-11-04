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
    func fetchPosts(success: @escaping ([Post]) -> (Void), failure: @escaping (Error) -> (Void))
    func fetchPost(id: String, success: @escaping (Post) -> (Void), failure: @escaping (Error) -> (Void))
    func createPost(post: Post, success: @escaping (Post) -> (Void), failure: @escaping (Error) -> (Void))
    func updatePost(post: Post, success: @escaping (Post) -> (Void), failure: @escaping (Error) -> (Void))
}

extension CoreService: RoomChatServiceDelegate {
    
}

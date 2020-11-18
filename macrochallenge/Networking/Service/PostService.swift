//
//  PostService.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 02/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol PostServiceDelegate {
    func fetchPosts(success: @escaping ([Post]) -> (Void), failure: @escaping (Error) -> (Void))
    func fetchPost(id: String, success: @escaping (Post) -> (Void), failure: @escaping (Error) -> (Void))
    func createPost(post: Post, success: @escaping (Post) -> (Void), failure: @escaping (Error) -> (Void))
    func updatePost(post: Post, success: @escaping (Post) -> (Void), failure: @escaping (Error) -> (Void))
}

extension CoreService: PostServiceDelegate {
    
    func fetchPosts(success: @escaping ([Post]) -> (Void), failure: @escaping (Error) -> (Void)) {
        db.collection("posts").addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                failure(error)
                return
            }
            
            var posts = [Post]()
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            posts = documents.compactMap { queryDocumentSnapshot -> Post? in
                return try? queryDocumentSnapshot.data(as: Post.self)
            }
            
            success(posts)
        }
    }
    
    func searchPosts(lookingForGroup: Bool, skillRating: String, role: String, success: @escaping ([Post]) -> (Void), failure: @escaping (Error) -> (Void)){
        
    
        var collection : Query = db.collection("posts")
        collection = collection.whereField("creator.lookingForGroup", isEqualTo: lookingForGroup)
            
        if skillRating != ""{
            collection = collection.whereField("creator.skillRating", isEqualTo: skillRating)
        }
        if role != ""{
            collection = collection.whereField("creator.role", isEqualTo: role)
        }
            collection.getDocuments { (querySnapshot, error) in
            if let error = error {
                failure(error)
                return
            }
            
            var posts = [Post]()
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            posts = documents.compactMap { queryDocumentSnapshot -> Post? in
                return try? queryDocumentSnapshot.data(as: Post.self)
            }
            
            success(posts)
        }
        
        
    }
    
    func fetchPost(id: String, success: @escaping (Post) -> (Void), failure: @escaping (Error) -> (Void)) {
        var posts = [Post]()
        db.collection("posts")
            .whereField("id", isEqualTo: id)
            .addSnapshotListener { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    posts = querySnapshot.documents.compactMap { document in
                        try? document.data(as: Post.self)
                    }
                    if posts.count != 0 {
                        success(posts[0])
                        return
                    }
                    
                    success(Post())
                }
                
                if let error = error {
                    failure(error)
                    return
                }
        }
    }
    
    func createPost(post: Post, success: @escaping (Post) -> (Void), failure: @escaping (Error) -> (Void)) {
        do {
            let id = db.collection("posts").document().documentID
            var addedPosts = post
            addedPosts.id = id
            let _ = try db.collection("posts").document(id).setData(from: addedPosts)
            success(addedPosts)
            return
        } catch {
            failure(error)
            return
        }
    }
    
    func updatePost(post: Post, success: @escaping (Post) -> (Void), failure: @escaping (Error) -> (Void)) {
        if let id = post.id {
            do {
                try db.collection("posts").document(id).setData(from: post)
                success(post)
            } catch {
                failure(error)
                return
            }
        }
    }
    
    
}

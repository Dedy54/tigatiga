//
//  PostInteractor.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 02/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase

protocol PostInteractorDelegate {
    func fetchPosts(success: @escaping ([Post]) -> (Void), failure: @escaping (Error) -> (Void))
    func fetchPost(id: String, success: @escaping (Post) -> (Void), failure: @escaping (Error) -> (Void))
    func createPost(post: Post, success: @escaping (Post) -> (Void), failure: @escaping (Error) -> (Void))
    func updatePost(post: Post, success: @escaping (Post) -> (Void), failure: @escaping (Error) -> (Void))
}

class PostInteractor: BaseInteractor, PostInteractorDelegate {
    var posts: [Post] = []
    var post: Post = Post()
    
    func fetchPosts(success: @escaping ([Post]) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchPosts(success: { (posts) -> (Void) in
            self.posts = posts
            success(posts)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func fetchPost(id: String, success: @escaping (Post) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchPost(id: id, success: { (post) -> (Void) in
            self.post = post
            success(post)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func createPost(post: Post, success: @escaping (Post) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.createPost(post: post, success: { (post) -> (Void) in
            self.post = post
            success(post)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func updatePost(post: Post, success: @escaping (Post) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.updatePost(post: post, success: { (post) -> (Void) in
            self.post = post
            success(post)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    // Mark: Func not yet
    func filterPost(success: @escaping ([Post]) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchPosts(success: { (posts) -> (Void) in
            self.posts = posts
            success(posts)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
}

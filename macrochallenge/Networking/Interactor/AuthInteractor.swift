//
//  UserInteractor.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 22/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase
import AuthenticationServices
import FirebaseAuth

class AuthInteractor: BaseInteractor {
    
    var authDataResult: AuthDataResult?
    var user: Users = Users()
    
    func loginWithEmail(email: String, password: String, success: @escaping (AuthDataResult) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.loginWithEmail(email: email, password: password, success: { (authDataResult) -> (Void) in
            self.authDataResult = authDataResult
            success(authDataResult)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func registerWithEmail(email: String, password: String, success: @escaping (AuthDataResult) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.registerWithEmail(email: email, password: password, success: { (authDataResult) -> (Void) in
            self.authDataResult = authDataResult
            success(authDataResult)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func signInCredential(credential: OAuthCredential, success: @escaping (AuthDataResult) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.signInCredential(credential: credential, success: { (authDataResult) -> (Void) in
            self.authDataResult = authDataResult
            success(authDataResult)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func signInWithApple(currentNonce: String?, credential: ASAuthorizationAppleIDCredential?, success: @escaping (AuthDataResult) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.signInWithApple(currentNonce: currentNonce, credential: credential, success: { (authDataResult) -> (Void) in
            self.authDataResult = authDataResult
            success(authDataResult)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func signInWithApple(currentNonce: String?, credential: ASAuthorizationAppleIDCredential?, success: @escaping (AuthDataResult, Users, Player?) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.signInWithApple(currentNonce: currentNonce, credential: credential, success: { (authDataResult) -> (Void) in
            self.authDataResult = authDataResult
            let email = authDataResult.user.email ?? ""
            let displayName = authDataResult.user.displayName ?? ""
            let uid = Auth.auth().currentUser?.uid
            self.service.fetchUser(email: email, success: { (fetchUser) -> (Void) in
                if fetchUser.uid == nil {
                    var tempUser = Users()
                    tempUser.email = email
                    tempUser.uid = uid
                    self.service.createUser(users: tempUser, success: { (createUser) -> (Void) in
                        self.user = createUser
                        var tempPlayer = Player(id: uid, name: displayName, experience: "", commendations: nil, lookingForGroup: true, imageProfile: "", user: tempUser, skillRating: "", role: "")
                        self.service.createPlayer(player: tempPlayer, success: { (player) -> (Void) in
                            print(player)
                            tempPlayer = player
                        }) { (error) -> (Void) in
                            print(error)
                        }
                        success(authDataResult, createUser, tempPlayer)
                    }) { (error) -> (Void) in
                        failure(error)
                    }
                } else {
                    success(authDataResult, fetchUser, nil)
                }
            }) { (error) -> (Void) in
                failure(error)
            }
            
        }) { (error) -> (Void) in
            failure(error)
        }
    }
}


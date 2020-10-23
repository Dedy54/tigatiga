//
//  Auth.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 22/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import AuthenticationServices

extension CoreService {
    
    func loginWithEmail(email: String, password: String, success: @escaping (AuthDataResult) -> (Void), failure: @escaping (Error) -> (Void)) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                failure(error)
                return
            }
            
            if let authResult = authResult {
                success(authResult)
                return
            }
        }
    }
    
    func registerWithEmail(email: String, password: String, success: @escaping (AuthDataResult) -> (Void), failure: @escaping (Error) -> (Void)) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                failure(error)
                return
            }
            
            if let authResult = authResult {
                success(authResult)
                return
            }
        }
    }
    
    func signInCredential(credential: OAuthCredential, success: @escaping (AuthDataResult) -> (Void), failure: @escaping (Error) -> (Void)) {
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                failure(error)
                return
            }
            
            if let authResult = authResult {
                success(authResult)
                return
            }
        }
    }
    
    func signInWithApple(currentNonce: String?, credential: ASAuthorizationAppleIDCredential?, success: @escaping (AuthDataResult) -> (Void), failure: @escaping (Error) -> (Void)) {
        if let appleIDCredential = credential {
            guard let nonce = currentNonce else {
                print("Invalid state: A login callback was received, but no login request was sent.")
                return
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
            self.signInCredential(credential: credential, success: { (authResult) -> (Void) in
                success(authResult)
            }) { (error) -> (Void) in
                failure(error)
            }
        }
    }
    
    
    
}

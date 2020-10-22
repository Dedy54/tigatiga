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
    
    func signInWithCredential(currentNonce: String?, controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization, success: @escaping (AuthDataResult) -> (Void), failure: @escaping (Error) -> (Void)) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            // Initialize a Firebase credential.
            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
            // Sign in with Firebase.
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
    }
}

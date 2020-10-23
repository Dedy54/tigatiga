//
//  UserInteractor.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 22/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase

class AuthInteractor: BaseInteractor {
    
    var authDataResult: AuthDataResult?
    
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
    
    
}


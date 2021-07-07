//
//  Core.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 22/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

public class CoreService: NSObject {
    
    public static let instance = CoreService()
    
    let db = Firestore.firestore()
    
    func handleError(errorHandler: @escaping(_ error: Error) -> Void, error: Error? = nil) {
        if let error = error {
            DispatchQueue.main.async {
                errorHandler(error)
            }
        }
    }
}

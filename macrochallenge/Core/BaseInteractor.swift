//
//  BaseInteractor.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 22/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase

open class BaseInteractor {
    
    public var service = CoreService.instance
    let db = Firestore.firestore()
    
}

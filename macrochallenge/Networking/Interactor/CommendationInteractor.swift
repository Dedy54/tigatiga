//
//  CommendationInteractor.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 26/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase

protocol CommendationInteractorDelegate {
    func fetchCommendation(success: @escaping ([Commendation]) -> (Void), failure: @escaping (Error) -> (Void))
    func fetchCommendation(id: String, success: @escaping (Commendation) -> (Void), failure: @escaping (Error) -> (Void))
    func createCommendation(commendation: Commendation, success: @escaping (Commendation) -> (Void), failure: @escaping (Error) -> (Void))
    func updateCommendation(commendation: Commendation, success: @escaping (Commendation) -> (Void), failure: @escaping (Error) -> (Void))
}

class CommendationInteractor: BaseInteractor, CommendationInteractorDelegate {
    
    var commendations: [Commendation] = []
    var commendation: Commendation = Commendation()
    
    func fetchCommendation(success: @escaping ([Commendation]) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchCommendations(success: { (commendations) -> (Void) in
            self.commendations = commendations
            success(commendations)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func fetchCommendation(id: String, success: @escaping (Commendation) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchCommendations(id: id, success: { (commendation) -> (Void) in
            self.commendation = commendation
            success(commendation)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func createCommendation(commendation: Commendation, success: @escaping (Commendation) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.createCommendation(commendation: commendation, success: { (commendation) -> (Void) in
            self.commendation = commendation
            success(commendation)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func updateCommendation(commendation: Commendation, success: @escaping (Commendation) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.updateCommendation(commendation: commendation, success: { (commendation) -> (Void) in
            self.commendation = commendation
            success(commendation)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
}

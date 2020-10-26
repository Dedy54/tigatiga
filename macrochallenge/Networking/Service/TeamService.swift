//
//  TeamService.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 26/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

extension CoreService {
    
    func fetchTeams(success: @escaping ([Team]) -> (Void), failure: @escaping (Error) -> (Void)) {
        db.collection("teams").addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                failure(error)
                return
            }
            
            var teams = [Team]()
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            teams = documents.compactMap { queryDocumentSnapshot -> Team? in
                return try? queryDocumentSnapshot.data(as: Team.self)
            }
            
            success(teams)
        }
    }
    
    func fetchTeams(id: String, success: @escaping (Team) -> (Void), failure: @escaping (Error) -> (Void)) {
        var teams = [Team]()
        db.collection("teams")
            .whereField("id", isEqualTo: id)
            .addSnapshotListener { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    teams = querySnapshot.documents.compactMap { document in
                        try? document.data(as: Team.self)
                    }
                    if teams.count != 0 {
                        success(teams[0])
                        return
                    }
                    
                    success(Team())
                }
                
                if let error = error {
                    failure(error)
                    return
                }
        }
    }
    
    func createTeam(teams: Team, success: @escaping (Team) -> (Void), failure: @escaping (Error) -> (Void)) {
        do {
            let id = db.collection("teams").document().documentID
            var addedTeams = teams
            addedTeams.id = id
            let _ = try db.collection("teams").document(id).setData(from: addedTeams)
            success(teams)
            return
        } catch {
            failure(error)
            return
        }
    }
    
    func updateTeam(team: Team, success: @escaping (Team) -> (Void), failure: @escaping (Error) -> (Void)) {
        if let id = team.id {
            do {
                try db.collection("teams").document(id).setData(from: team)
                success(team)
            } catch {
                failure(error)
                return
            }
        }
    }
    
}

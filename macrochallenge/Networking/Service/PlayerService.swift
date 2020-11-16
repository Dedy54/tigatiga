//
//  PlayerService.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 26/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

extension CoreService {
    
    func fetchPlayers(success: @escaping ([Player]) -> (Void), failure: @escaping (Error) -> (Void)) {
        db.collection("players").addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                failure(error)
                return
            }
            
            var players = [Player]()
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            players = documents.compactMap { queryDocumentSnapshot -> Player? in
                return try? queryDocumentSnapshot.data(as: Player.self)
            }
            
            success(players)
        }
    }
    
    func searchPlayer(name: String, comendation: String, skillRating: String, role: String, success: @escaping ([Player]) -> (Void), failure: @escaping (Error) -> (Void)){
        
        db.collection("players")
            .whereField("name", isEqualTo: name)
            .whereField("skillRating", isEqualTo: skillRating)
            .whereField("role", isEqualTo: role)
            .addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                failure(error)
                return
            }
            
            var players = [Player]()
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            players = documents.compactMap { queryDocumentSnapshot -> Player? in
                return try? queryDocumentSnapshot.data(as: Player.self)
            }
            
            success(players)
        }
        
    }
    
    func fetchPlayer(id: String, success: @escaping (Player) -> (Void), failure: @escaping (Error) -> (Void)) {
        var players = [Player]()
        db.collection("players")
            .whereField("id", isEqualTo: id)
            .addSnapshotListener { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    players = querySnapshot.documents.compactMap { document in
                        try? document.data(as: Player.self)
                    }
                    if players.count != 0 {
                        success(players[0])
                        return
                    }
                    
                    success(Player())
                }
                
                if let error = error {
                    failure(error)
                    return
                }
        }
    }
    
    func createPlayer(player: Player, success: @escaping (Player) -> (Void), failure: @escaping (Error) -> (Void)) {
        do {
            let _ = try db.collection("players").document(player.id ?? "0").setData(from: player)
            success(player)
            return
        } catch {
            failure(error)
            return
        }
    }
    
    func updatePlayer(player: Player, success: @escaping (Player) -> (Void), failure: @escaping (Error) -> (Void)) {
        if let id = player.id {
            do {
                try db.collection("players").document(id).setData(from: player)
                success(player)
            } catch {
                failure(error)
                return
            }
        }
    }
    
}

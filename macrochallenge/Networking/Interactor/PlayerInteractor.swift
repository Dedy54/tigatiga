//
//  PlayerInteractor.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 26/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

protocol PlayerInteractorDelegate {
    func fetchPlayers(success: @escaping ([Player]) -> (Void), failure: @escaping (Error) -> (Void))
    func fetchPlayer(id: String, success: @escaping (Player) -> (Void), failure: @escaping (Error) -> (Void))
    func createPlayer(player: Player, success: @escaping (Player) -> (Void), failure: @escaping (Error) -> (Void))
    func updatePlayer(player: Player, success: @escaping (Player) -> (Void), failure: @escaping (Error) -> (Void))
    func currentPlayer(success: @escaping (Player) -> (Void), failure: @escaping (Error) -> (Void))
    func searchPlayers(name: String, comendation: String, skillRating: String, role: String, success: @escaping ([Player]) -> (Void), failure: @escaping (Error) -> (Void))
}

class PlayerInteractor: BaseInteractor, PlayerInteractorDelegate {
    
    var players: [Player] = []
    var player: Player = Player()
    
    func fetchPlayers(success: @escaping ([Player]) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchPlayers(success: { (players) -> (Void) in
            print("players : \(players)")
            self.players = players
            success(players)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func fetchPlayer(id: String, success: @escaping (Player) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchPlayer(id: id, success: { (player) -> (Void) in
            self.player = player
            success(player)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func createPlayer(player: Player, success: @escaping (Player) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.createPlayer(player: player, success: { (player) -> (Void) in
            self.player = player
            success(player)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func updatePlayer(player: Player, success: @escaping (Player) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.updatePlayer(player: player, success: { (player) -> (Void) in
            self.player = player
            success(player)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    // MARK: Func not yet
    func filterPlayers(teamName: String, roleInNeed: String, avgSkillRating: String, memberSize: String, role: String, success: @escaping ([Player]) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchPlayers(success: { (players) -> (Void) in
            print("players : \(players)")
            self.players = players
            success(players)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func currentPlayer(success: @escaping (Player) -> (Void), failure: @escaping (Error) -> (Void)) {
        let uid = Auth.auth().currentUser?.uid ?? "0"
        service.fetchPlayer(id: uid, success: { (player) -> (Void) in
            self.player = player
            success(player)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func searchPlayers(name: String, comendation: String, skillRating: String, role: String, success: @escaping ([Player]) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.searchPlayer(name: name, comendation: comendation, skillRating: skillRating, role: role, success: { (players) -> (Void) in
            print("players : \(players)")
            self.players = players
            success(players)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
}

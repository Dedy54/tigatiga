//
//  TeamInteractor.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 26/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

protocol TeamInteractorDelegate {
    func fetchTeams(success: @escaping ([Team]) -> (Void), failure: @escaping (Error) -> (Void))
    func fetchTeam(id: String, success: @escaping (Team) -> (Void), failure: @escaping (Error) -> (Void))
    func createTeam(team: Team, success: @escaping (Team) -> (Void), failure: @escaping (Error) -> (Void))
    func updateTeam(team: Team, success: @escaping (Team) -> (Void), failure: @escaping (Error) -> (Void))
    func fetchMyTeams(success: @escaping ([Team]) -> (Void), failure: @escaping (Error) -> (Void))
}

class TeamInteractor: BaseInteractor, TeamInteractorDelegate {
    
    var teams: [Team] = []
    var team: Team = Team()
    
    func fetchTeams(success: @escaping ([Team]) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchTeams(success: { (teams) -> (Void) in
            print("teams : \(teams)")
            self.teams = teams
            success(teams)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func fetchTeam(id: String, success: @escaping (Team) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchTeams(id: id, success: { (team) -> (Void) in
            self.team = team
            success(team)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func createTeam(team: Team, success: @escaping (Team) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.createTeam(teams: team, success: { (team) -> (Void) in
            self.team = team
            success(team)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func updateTeam(team: Team, success: @escaping (Team) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.updateTeam(team: team, success: { (team) -> (Void) in
            self.team = team
            success(team)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    // Mark: Func not yet
    func filterTeams(teamName: String, roleInNeed: String, avgSkillRating: String, memberSize: String, role: String, success: @escaping ([Team]) -> (Void), failure: @escaping (Error) -> (Void)) {
        print("service fetch teams with data ", roleInNeed, avgSkillRating, memberSize, role)
        service.fetchTeams(success: { (teams) -> (Void) in
            print("teams : \(teams)")
            self.teams = teams
            success(teams)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func fetchMyTeams(success: @escaping ([Team]) -> (Void), failure: @escaping (Error) -> (Void)) {
        let uid = Auth.auth().currentUser?.uid ?? "0"
        service.fetchPlayer(id: uid, success: { (player) -> (Void) in
            self.service.fetchMyTeams(player: player, success: { (teams) -> (Void) in
                self.teams = teams
                success(teams)
            }) { (error) -> (Void) in
                failure(error)
            }
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
}

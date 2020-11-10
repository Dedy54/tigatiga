//
//  SearchTeam.swift
//  macrochallenge
//
//  Created by Bryanza on 02/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation

enum GameTitle: String, CaseIterable
{
    case Valorant = "Valorant"
    case Overwatch = "Overwatch"
    case CSGO = "Counter Strike Global Offensive"
    case PUBG = "Player Unknowns Battle Ground"
}

enum GameTeamMember: String, CaseIterable {
    case One = "1"
    case Two = "2"
    case Three = "3"
    case Four = "4"
    case Five = "5"
    case Six = "6"
    case Seven = "7"
    case Eight = "8"
    case Nine = "9"
    case Ten = "10"
}

class SwitchGame {
//    static let shared  = SwitchGame()
    var roles: [String] = []
    var skills: [String] = []
    var teamMembers: [String] = GameTeamMember.allCases.map { $0.rawValue }
    func setTitle(_ title: GameTitle) {
        switch title {
        case .Valorant:
            roles = ValorantRole.allCases.map { $0.rawValue }
            skills = ValorantSkill.allCases.map { $0.rawValue }
        case .Overwatch:
            roles = OverwatchRole.allCases.map { $0.rawValue }
            skills = OverwatchSkill.allCases.map { $0.rawValue }
        case .CSGO:
            roles = CounterStrikeRole.allCases.map { $0.rawValue }
            skills = CounterStrikeSkill.allCases.map { $0.rawValue }
        case .PUBG:
            roles = PlayerUnknownsRole.allCases.map { $0.rawValue }
            skills = PlayerUnknownsSkill.allCases.map { $0.rawValue }
        }
    }
}

enum ValorantRole: String, CaseIterable {
    case Sentinel = "Sentinel"
    case Duelist = "Duelist"
    case Initiator = "Initiator"
    case Controller = "Controller"
}

enum OverwatchRole: String, CaseIterable {
    case Tank = "Tank"
    case DPS = "DPS"
    case Healer = "Healer"
}

enum CounterStrikeRole: String, CaseIterable {
    case Sniper = "Sniper"
    case Bait = "Bait"
}

enum PlayerUnknownsRole: String, CaseIterable {
    case Support = "Support"
    case Sniper = "Sniper"
    case Lurker = "Lurker"
    case Carry = "Carry"
    case InGameLeader = "In-game Leader"
    case Scout = "Scout"
}

enum ValorantSkill: String, CaseIterable {
    case Iron1 = "Iron 1"
    case Iron2 = "Iron 2"
    case Iron3 = "Iron 3"
    case Bronze1 = "Bronze 1"
    case Bronze2 = "Bronze 2"
    case Bronze3 = "Bronze 3"
    case Silver1 = "Silver 1"
    case Silver2 = "Silver 2"
    case Silver3 = "Silver 3"
    case Gold1 = "Gold 1"
    case Gold2 = "Gold 2"
    case Gold3 = "Gold 3"
    case Platinum1 = "Platinum 1"
    case Platinum2 = "Platinum 2"
    case Platinum3 = "Platinum 3"
    case Diamond1 = "Diamond 1"
    case Diamond2 = "Diamond 2"
    case Diamond3 = "Diamond 3"
    case Immortal1 = "Immortal 1"
    case Immortal2 = "Immortal 2"
    case Immortal3 = "Immortal 3"
    case Radiant = "Radiant"
}

enum OverwatchSkill: String, CaseIterable {
    case Bronze = "Bronze"
    case Silver = "Silver"
    case Gold = "Gold"
    case Platinum = "Platinum"
    case Diamond = "Diamond"
    case Master = "Master"
    case GrandMaster = "GrandMaster"
}

enum CounterStrikeSkill: String, CaseIterable {
    case Silver1 = "Silver I"
    case Silver2 = "Silver II"
    case Silver3 = "Silver III"
    case Silver4 = "Silver IV"
    case Silver5 = "Silver Elite"
    case Silver6 = "Silver Elite Master"
    case Gold1 = "Gold Nova I"
    case Gold2 = "Gold Nova II"
    case Gold3 = "Gold Nova III"
    case Gold4 = "Gold Nova Master"
    case Master1 = "Master Guardian I"
    case Master2 = "Master Guardian II"
    case Master3 = "Master Guardian Elite"
    case Master4 = "Distinguished Master Guardian"
    case Eagle1 = "Legendary Eagle"
    case Eagle2 = "Legendary Eagle Master"
    case Supreme1 = "Supreme Master First Class"
    case Supreme2 = "The Global Elite"
}

enum PlayerUnknownsSkill: String, CaseIterable {
    case Bronze1 = "Bronze 5"
    case Bronze2 = "Bronze 4"
    case Bronze3 = "Bronze 3"
    case Bronze4 = "Bronze 2"
    case Bronze5 = "Bronze 1"
    case Silver1 = "Silver 5"
    case Silver2 = "Silver 4"
    case Silver3 = "Silver 3"
    case Silver4 = "Silver 2"
    case Silver5 = "Silver 1"
    case Gold1 = "Gold 5"
    case Gold2 = "Gold 4"
    case Gold3 = "Gold 3"
    case Gold4 = "Gold 2"
    case Gold5 = "Gold 1"
    case Platinum1 = "Platinum 5"
    case Platinum2 = "Platinum 4"
    case Platinum3 = "Platinum 3"
    case Platinum4 = "Platinum 2"
    case Platinum5 = "Platinum 1"
    case Diamond1 = "Diamond 5"
    case Diamond2 = "Diamond 4"
    case Diamond3 = "Diamond 3"
    case Diamond4 = "Diamond 2"
    case Diamond5 = "Diamond 1"
    case Master1 = "Master 5"
    case Master2 = "Master 4"
    case Master3 = "Master 3"
    case Master4 = "Master 2"
    case Master5 = "Master 1"
}

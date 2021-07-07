//
//  CompleteProfileViewController.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 13/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

enum GamePlay {
    
    static func roleByGame(game: String) -> [String] {
        let game = game.lowercased()
        switch game {
        case GameTitle.Valorant.rawValue.lowercased() :
            return ValorantRole.allCases.map { $0.rawValue }
        case GameTitle.Overwatch.rawValue.lowercased() :
            return OverwatchRole.allCases.map { $0.rawValue }
        case GameTitle.CSGO.rawValue.lowercased() :
            return CounterStrikeRole.allCases.map { $0.rawValue }
        case GameTitle.PUBG.rawValue.lowercased() :
            return PlayerUnknownsRole.allCases.map { $0.rawValue }
        default:
            return []
        }
    }
    
    static func skillByGame(game: String) -> [String] {
        let game = game.lowercased()
        switch game {
        case GameTitle.Valorant.rawValue.lowercased() :
            return ValorantSkill.allCases.map { $0.rawValue }
        case GameTitle.Overwatch.rawValue.lowercased() :
            return OverwatchSkill.allCases.map { $0.rawValue }
        case GameTitle.CSGO.rawValue.lowercased() :
            return CounterStrikeSkill.allCases.map { $0.rawValue }
        case GameTitle.PUBG.rawValue.lowercased() :
            return PlayerUnknownsSkill.allCases.map { $0.rawValue }
        default:
            return []
        }
    }
}

class CompleteProfileViewController: UIViewController {
    
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var skillLabel: UILabel!
    
    var selectedGames = "Choose Games"
    var selectedRoles = "Choose Roles"
    var selectedSkillRating = "Choose Skill"
    
    var users: Users?
    var playerInteractor: PlayerInteractor?
    
    @IBAction func actionGame(_ sender: Any) {
        let done: ActionStringDoneBlock = {(picker, selectedIndex, selectedValue) in
            self.selectedGames = selectedValue as! String
            self.selectedRoles = GamePlay.roleByGame(game: self.selectedGames)[0]
            self.selectedSkillRating = GamePlay.skillByGame(game: self.selectedGames)[0]
            self.bindView()
        }

        let gameTitles = GameTitle.allCases.map { $0.rawValue }
        let picker = ActionSheetStringPicker(title: "Choose Game", rows: gameTitles, initialSelection: 0, doneBlock: done, cancel: nil, origin: sender)

        let doneButton = UIBarButtonItem(title: "DONE", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "CANCEL", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        picker?.setDoneButton(doneButton)
        picker?.setCancelButton(cancelButton)

        picker?.show()
    }
    
    @IBAction func actionRole(_ sender: Any) {
        let done: ActionStringDoneBlock = {(picker, selectedIndex, selectedValue) in
            self.selectedRoles = selectedValue as! String
            self.bindView()
        }

        let roles = GamePlay.roleByGame(game: self.selectedGames)
        let picker = ActionSheetStringPicker(title: "Choose Role", rows: roles, initialSelection: 0, doneBlock: done, cancel: nil, origin: sender)

        let doneButton = UIBarButtonItem(title: "DONE", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "CANCEL", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        picker?.setDoneButton(doneButton)
        picker?.setCancelButton(cancelButton)

        picker?.show()
    }
    
    @IBAction func actionSkillRating(_ sender: Any) {
        let done: ActionStringDoneBlock = {(picker, selectedIndex, selectedValue) in
            print("done")
            self.selectedSkillRating = selectedValue as! String
            self.bindView()
        }

        let skill = GamePlay.skillByGame(game: selectedGames)
        let picker = ActionSheetStringPicker(title: "Choose Skill Rating", rows: skill, initialSelection: 0, doneBlock: done, cancel: nil, origin: sender)

        let doneButton = UIBarButtonItem(title: "DONE", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "CANCEL", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        picker?.setDoneButton(doneButton)
        picker?.setCancelButton(cancelButton)

        picker?.show()
    }
    
    @IBAction func actionApply(_ sender: Any) {
        if self.selectedGames != "Choose Games" && self.selectedRoles != "Choose Roles" && self.selectedSkillRating != "Choose Skill" {
            self.playerInteractor = PlayerInteractor()
            let player = Player(id: nil, name: self.users?.name, experience: "", commendations: nil, lookingForGroup: false, imageProfile: "", user: self.users, skillRating: self.selectedSkillRating, role: self.selectedRoles, game: self.selectedGames, teams: nil)
            self.playerInteractor?.createPlayer(player: player, success: { (player) -> (Void) in
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) -> (Void) in
                print(error)
            })
        } else {
            return
        }
    }
    
    func bindView() {
        self.gameLabel.text = self.selectedGames
        self.roleLabel.text = self.selectedRoles
        self.skillLabel.text = self.selectedSkillRating
    }
    
    static func instantiateViewController() -> CompleteProfileViewController {
        let controller = CompleteProfileViewController(nibName: "CompleteProfileViewController", bundle: nil)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindView()
    }

}

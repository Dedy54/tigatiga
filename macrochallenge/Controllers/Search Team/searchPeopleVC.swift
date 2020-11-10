//
//  searchPeopleVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 26/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class searchPeopleVC: UIViewController{

    @IBOutlet var viewContainer: UIView!
    @IBOutlet var applyButton: UIButton!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    var searchPlayerVC = searchForPlayerVC()
    var searchTeamVC = searchForTeamVC()
    
   
    var views : [UIView]!
    
    let playerInteractor: PlayerInteractor? = PlayerInteractor()
    let teamInteractor: TeamInteractor? = TeamInteractor()
    var selectedView: Int? = 0
    var players: [Player] = []
    var teams: [Team] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        segmentedControl.frame.size.height = 40
        setApplyBtnShape()
        
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        setSegmentedViewInContainer()
        
        overrideUserInterfaceStyle = .dark
        
    }
    
    func setApplyBtnShape(){
        applyButton.layer.cornerRadius = 10
    }
    
    func setSegmentedViewInContainer(){
        views = [UIView]()
        views.append(searchPlayerVC.view)
        views.append(searchTeamVC.view)
        
        for v in views {
            viewContainer.addSubview(v)
            
        }
        self.addChild(searchPlayerVC)
        self.addChild(searchTeamVC)
        viewContainer.bringSubviewToFront(views[0])
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            textField.resignFirstResponder()
//           return false
//       }
    
    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
        views[sender.selectedSegmentIndex].isUserInteractionEnabled = true
        self.viewContainer.bringSubviewToFront(views[sender.selectedSegmentIndex])
        selectedView = sender.selectedSegmentIndex
    }
    
    @IBAction func callInteractor(_ sender: UIButton) {
        switch sender {
        case applyButton:
            if views[selectedView!] == searchPlayerVC.view {
                let teamName:String = ""
                let roleInNeed = searchPlayerVC.rolePlayerTextField.text!
                let avgSkillRating = searchPlayerVC.skillRatingPlayerTextField.text!
                let memberSize: String = ""
                let role: String = ""
                print("call player interactor with data ", roleInNeed, avgSkillRating)
                playerInteractor?.filterPlayers(teamName: teamName, roleInNeed: roleInNeed, avgSkillRating: avgSkillRating, memberSize: memberSize, role: role, success: { (playerResults) -> (Void) in
                    self.players = playerResults
                    self.performSegue(withIdentifier: "unwindToResult", sender: nil)
                }, failure: { (err) -> (Void) in
                     print("failed to get player data with error \(err)")
                })
            }else{
                let teamName:String = "Team C"
                let roleInNeed = searchTeamVC.roleINTxtField.text!
                let avgSkillRating = searchTeamVC.skillRatingTxtField.text!
                let memberSize = searchTeamVC.memberSizeTxtField.text!
                let role = searchTeamVC.roleTxtField.text!
                print("call team interactor with data ", roleInNeed, avgSkillRating, memberSize, role)
                teamInteractor?.filterTeams(teamName: teamName, roleInNeed: roleInNeed, avgSkillRating: avgSkillRating, memberSize: memberSize, role: role, success: { (teamResults) -> (Void) in
                    self.teams = teamResults
                    self.performSegue(withIdentifier: "unwindToResult", sender: nil)
                }, failure: { (err) -> (Void) in
                    print("failed to get team data with error \(err)")
                })
            }
        default:
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToResult"
        {
            let searchResultVC = segue.destination as! SearchResultVC
            searchResultVC.teams = teams
        }
    }
    
}




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
    
    enum commendations : Int{
        case mvp
        case teamleader
        case friendly
        case teamplayer
    }
    
   
    var views : [UIView]!
    
    let playerInteractor: PlayerInteractor? = PlayerInteractor()
    let teamInteractor: TeamInteractor? = TeamInteractor()
    var selectedView: Int? = 0
    var players: [Player] = []
    var teams: [Team] = []
    var mabarYellowTranspararent = UIColor(hex: "#ffce0032")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        segmentedControl.frame.size.height = 40
        setApplyBtnShape()
        
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        setSegmentedViewInContainer()
        
        overrideUserInterfaceStyle = .dark
        
        self.title = "Search"
        
    }
    
    func setApplyBtnShape(){
        applyButton.layer.cornerRadius = 10
        applyButton.titleLabel?.font = UIFont(name: "Hind-Bold", size: 16)
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
                let playerName:String = searchPlayerVC.searchPlayerTxtField.text!
                let commendationType : commendations = getCommendationType()
                let commendation = String(describing: commendationType)
                let skillRating = searchPlayerVC.skillRatingPlayerTextField.text!
                let role = searchPlayerVC.rolePlayerTextField.text!
//                print("call player interactor with data ", roleInNeed, avgSkillRating)
                playerInteractor?.searchPlayers(name: playerName, comendation: commendation, skillRating: skillRating, role: role, success: { (playerResults) -> (Void) in
                    self.players = playerResults
                    self.performSegue(withIdentifier: "showResult", sender: nil)
                }, failure: { (err) -> (Void) in
                     print("failed to get player data with error \(err)")
                })
            }else{
                let teamName:String = searchPlayerVC.searchPlayerTxtField.text!
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
    
    func getCommendationType() -> commendations{
        for (index, button) in searchPlayerVC.commendationButton.enumerated(){
            if button.backgroundColor == mabarYellowTranspararent{
                return commendations(rawValue: index) ?? .mvp
            }
        }
        return .mvp
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult"
        {
            let searchResultVC = segue.destination as! SearchResultVC
            if views[selectedView!] == searchPlayerVC.view {
                searchResultVC.players = players
                searchResultVC.teams = []
            }else {
                searchResultVC.teams = teams
                searchResultVC.players = []
            }
        }
    }
    
}




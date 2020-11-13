//
//  profilePeopleVC.swift
//  macrochallenge
//
//  Created by Bryanza on 11/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import UIKit

class profilePeopleVC: UIViewController {
    
    @IBOutlet weak var teamTableView: UITableView!
    @IBOutlet weak var scrollContainer: UIScrollView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var profileMeVC = profileForMeVC()
    var profileMyTeamVC = profileForMyTeamVC()
     
    
//    var views : [UIView]!
//    var selectedView: Int? = 0
    
    var teams: [Team] = []
    let teamInteractor: TeamInteractor? = TeamInteractor()
    var selectedPeople: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button1 = UIBarButtonItem(image: #imageLiteral(resourceName: "menu") , style: .plain, target: self, action: #selector(tapped))
        self.navigationItem.rightBarButtonItem  = button1
        profileMeVC.selectedPlayer = selectedPeople
        scrollContainer.contentSize = CGSize(width: scrollContainer.frame.size.width, height: profileMeVC.view.frame.size.height)
        scrollContainer.addSubview(profileMeVC.view)
        self.addChild(profileMeVC)
        scrollContainer.bringSubviewToFront(profileMeVC.view)
        
        setupTeamTableView()
        
        self.hideKeyboardWhenTappedAround()
        segmentedControl.frame.size.height = 40
        
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        setSegmentedViewInContainer()
        
        overrideUserInterfaceStyle = .dark
        getTeam()
    }
    
    @objc func tapped() {
        
    }
    
    private func setupTeamTableView() {
        teamTableView.dataSource = self
        teamTableView.delegate = self
        teamTableView.scrollsToTop = true
        teamTableView.register(UINib(nibName: "profileForMyTeamVC", bundle: nil), forCellReuseIdentifier:"TeamCell")
        teamTableView.estimatedRowHeight = 360
    }
    
    func getTeam() {
        teamInteractor?.fetchMyTeams(id: selectedPeople!.id!, success: { (teamResults) -> (Void) in
            self.teams = teamResults
            self.teamTableView.reloadData()
        }, failure: { (err) -> (Void) in
            print("failed to get my team data with error \(err)")
        })
    }
    
    func setSegmentedViewInContainer(){
//       views = [UIView]()
//       views.append(profileMeVC.view)
//       views.append(profileMyTeamVC.view)
//
//       for v in views {
//           viewContainer.addSubview(v)
//
//       }
//       self.addChild(profileMeVC)
//       self.addChild(profileMyTeamVC)
//       viewContainer.bringSubviewToFront(views[0])
   }
    @IBAction func switchActionView(_ sender: UISegmentedControl) {
        if teamTableView.isHidden {
            teamTableView.isHidden = false
            scrollContainer.isHidden = true
        }else {
            teamTableView.isHidden = true
            scrollContainer.isHidden = false
        }
//        views[sender.selectedSegmentIndex].isUserInteractionEnabled = true
//       self.viewContainer.bringSubviewToFront(views[sender.selectedSegmentIndex])
//       selectedView = sender.selectedSegmentIndex
    }
}

extension profilePeopleVC: UITableViewDataSource, UIScrollViewDelegate, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teams.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = teamTableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as? profileForMyTeamVC else {return UITableViewCell()}
            
        let team = self.teams[indexPath.row]
        cell.teamName.text = team.name
        cell.teamSkill.text = team.skillRating ?? ""
        
//        cell.setData()
        
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let current = indexPath.row
//        let lastElement = self.games.count - 1
//        if (current == lastElement && !isLoading) {
//            loadData()
//        }
//    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        gameTableView.deselectRow(at: indexPath, animated: true)
//        let detail = GameDetailViewController(nibName: "GameDetailViewController", bundle: nil)
//        let game = games[indexPath.row]
//        detail.game = game
//
//        self.navigationController?.pushViewController(detail, animated: true)
//    }

}
